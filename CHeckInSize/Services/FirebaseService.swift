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
    
    func getDocumentIDByUser(
        login: String,
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
    
    func updatePassword(login: String,
                               password: String,
                               _ completion: @escaping (Bool, CustomError?) -> Void
    ) {
        
        self.getUsers() { users, error in
            guard !users.isEmpty
            else {
                if let error = error {
                    completion(false, error)
                }
                return
            }
            
            for user in users {
                if user.login == login {
                    var userUpd = user
                    userUpd.password = password
                    self.getDocumentIDByUser(login: login) { documentID, error in
                        guard documentID != nil else {
                            if let error = error {
                                completion(false, error)
                            }
                            return
                        }
                        let data = try! FirebaseEncoder().encode(userUpd)
                        if let documentID = documentID {
                            FirebaseService.db.document("\(CollectionNaming.userAccount.rawValue)/\(documentID)").updateData(data as! [AnyHashable : Any])
                        }
                        completion(true, nil)
                    }
                }
                return
            }
        
        }
    }
}
