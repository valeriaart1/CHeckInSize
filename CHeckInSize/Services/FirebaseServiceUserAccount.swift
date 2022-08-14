//
//  FirebaseServiceUserAccount.swift
//  CHeckInSize
//
//  Created by Валерия Артемьева on 6.08.22.
//

import Firebase
import CodableFirebase
import FirebaseFirestore

// MARK: - FirebaseService

final class FirebaseServiceUserAccount {
    
    private typealias FUError = CustomError
    private static let db = Firestore.firestore()
    private static let collectionName = "userAccount"
    
    func getUsers(
        _ completion: @escaping ([UserAccount], CustomError?) -> Void
    ) {
        let collection = FirebaseServiceUserAccount.db.collection(FirebaseServiceUserAccount.collectionName)
        var users = [UserAccount]()
        collection.getDocuments { querySnapshot, error in
            
            if error != nil {
                completion([UserAccount](),FUError.gettingFirebaseDataError)
            }
            
            guard let querySnapshot = querySnapshot else {
                return
            }
            
            querySnapshot.documents.forEach { user in
                do {
                    let user = try FirebaseDecoder().decode(UserAccount.self, from: user.data())
                    users.append(user)
                } catch {
                    completion([UserAccount](),FUError.decodingFirebaseDataError)
                }
            }
            
            completion(users, nil)
        }
    }
    
    func getDocumentId(
        by login: String,
        _ completion: @escaping (String?, CustomError?) -> Void
    ) {
        let collection = FirebaseServiceUserAccount.db.collection(FirebaseServiceUserAccount.collectionName)
        collection.getDocuments { querySnapshot, error in
            guard error == nil
            else {
                completion(nil, FUError.gettingFirebaseDataError)
                return
            }
            
            guard let querySnapshot = querySnapshot
            else {
                return
            }
            
            querySnapshot.documents.forEach { user in
                do {
                    let item = try FirebaseDecoder().decode(UserAccount.self, from: user.data())
                    
                    guard item.login == login
                    else {
                        completion(nil,FUError.decodingFirebaseDataError)
                        return
                    }
                    
                    completion(user.documentID,nil)
                } catch {
                    completion(nil,FUError.decodingFirebaseDataError)
                }
            }
        }
    }
    
    func getUserByDocumentID(
        documentId: String,
        _ completion: @escaping (String?, CustomError?) -> Void
    ) {
        let collection = FirebaseServiceUserAccount.db.collection(FirebaseServiceUserAccount.collectionName)
        
        collection.getDocuments { querySnapshot, error in
            guard error == nil
            else {
                completion(nil, FUError.gettingFirebaseDataError)
                return
            }
            
            guard let querySnapshot = querySnapshot
            else {
                return
            }
            
            querySnapshot.documents.forEach { user in
                do {
                    let item = try FirebaseDecoder().decode(UserAccount.self, from: user.data())
                    
                    guard user.documentID == documentId
                    else {
                        completion(nil, FUError.gettingDocumentIdError)
                        return
                    }
                    
                    completion(item.login,nil)
                } catch {
                    completion(nil,FUError.decodingFirebaseDataError)
                }
            }
        }
    }
    
    func setUser(user: UserAccount,
                 _ completion: @escaping (Bool, CustomError?) -> Void) {
        var data: Any = 0
        
        do {
            data = try FirebaseEncoder().encode(user)
        } catch {
            completion(false, FUError.encodingFirebaseDataError)
        }
        
        let collection = FirebaseServiceUserAccount.db.collection(FirebaseServiceUserAccount.collectionName)
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
                completion(false, FUError.gettingUserError)
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
                    completion(false, FUError.encodingFirebaseDataError)
                }

                guard let documentID = documentID,
                      let convertedData = data as? [AnyHashable : Any]
                else {
                    completion(false, FUError.gettingDocumentIdError)
                    return
                }

                FirebaseServiceUserAccount.db.document(
                    "\(FirebaseServiceUserAccount.collectionName)/\(documentID)"
                ).updateData(
                    convertedData
                )

                completion(true, nil)
            }
        }
    }
}
