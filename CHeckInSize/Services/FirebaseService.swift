//
//  FirebaseService.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 3.08.22.
//

import Firebase
import CodableFirebase
import FirebaseFirestore

enum CollectionNaming: String {
    case userAccount
}

// MARK: - FirebaseService

final class FirebaseService {
    
    private typealias FError = CustomError
    private static let db = Firestore.firestore()
    
    func getUsers(
        _ completion: @escaping ([User], CustomError?) -> Void
    ) {
        let collection = FirebaseService.db.collection(CollectionNaming.userAccount.rawValue)
        var users = [User]()
        collection.getDocuments { querySnapshot, error in
            
            if error != nil {
                completion([User](),FError.gettingFirebaseDataError)
            }
            
            guard let querySnapshot = querySnapshot else {
                return
            }
            
            querySnapshot.documents.forEach { user in
                do {
                    let item = try FirebaseDecoder().decode(User.self, from: user.data())
                    users.append(item)
                } catch {
                    completion([User](),FError.decodingFirebaseDataError)
                }
            }
            
            completion(users, nil)
        }
    }
    
    func getDocumentId(
        by login: String,
        _ completion: @escaping (String?, CustomError?) -> Void
    ) {
        let collection = FirebaseService.db.collection(CollectionNaming.userAccount.rawValue)
        collection.getDocuments { querySnapshot, error in
            
            if error != nil {
                completion(nil,FError.gettingFirebaseDataError)
            }
            
            guard let querySnapshot = querySnapshot else {
                return
            }
            
            querySnapshot.documents.forEach { user in
                do {
                    let item = try FirebaseDecoder().decode(User.self, from: user.data())
                    if item.login == login {
                        completion(user.documentID,nil)
                    }
                } catch {
                    completion(nil,FError.decodingFirebaseDataError)
                }
            }
        }
    }
    
    func getUserByDocumentID(
        documentId: String,
        _ completion: @escaping (String?, CustomError?) -> Void
    ) {
        let collection = FirebaseService.db.collection(CollectionNaming.userAccount.rawValue)
        collection.getDocuments { querySnapshot, error in
            
            if error != nil {
                completion(nil,FError.gettingFirebaseDataError)
            }
            
            guard let querySnapshot = querySnapshot else {
                return
            }
            
            querySnapshot.documents.forEach { user in
                do {
                    let item = try FirebaseDecoder().decode(User.self, from: user.data())
                    if user.documentID == documentId {
                        completion(item.login,nil)
                    }
                } catch {
                    completion(nil,FError.decodingFirebaseDataError)
                }
            }
        }
    }
    
    func setUser(user: User) {
        let data = try! FirebaseEncoder().encode(user)
        let collection = FirebaseService.db.collection(CollectionNaming.userAccount.rawValue)
        collection.addDocument(data: data as! [String : Any])
    }
    
    func updatePassword(
        login: String,
        password: String,
        _ completion: @escaping (Bool, CustomError?) -> Void
    ) {
        self.getUsers() { users, error in
            guard error == nil
            else {
                completion(false, error)
                return
            }

            guard !users.isEmpty,
                  var user = users.first(where: { $0.login == login })
            else {
                completion(false, FError.gettingUserError)
                return
            }

            user.password = password

            self.getDocumentId(by: login) { documentID, error in
                guard error == nil else {
                    completion(false, error)
                    return
                }

                var data: Any = 0

                do {
                    data = try FirebaseEncoder().encode(user)
                } catch {
                    completion(false, FError.encodingFirebaseDataError)
                }

                guard let documentID = documentID,
                      let convertedData = data as? [AnyHashable : Any]
                else {
                    completion(false, FError.gettingDocumentIdError)
                    return
                }

                FirebaseService.db.document(
                    "\(CollectionNaming.userAccount.rawValue)/\(documentID)"
                ).updateData(
                    convertedData
                )

                completion(true, nil)
            }
        }
    }
}

extension FirebaseService {

    private func decode<Entity: Decodable>(
        of type: Entity.Type,
        from data: [String : Any],
        _ completion: @escaping (Entity?, Error?) -> Void
    ) {
        do {
            let item = try FirebaseDecoder().decode(type.self, from: data)
            completion(item, nil)
        } catch let error {
            completion(nil, error)
        }
    }
}
