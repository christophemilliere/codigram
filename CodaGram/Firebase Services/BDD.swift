//
//  BDD.swift
//  CodaGram
//
//  Created by christophe milliere on 07/04/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class BDD {
    func verifyUserExist(id: String, completion: userCompletion?) {
        Ref().userSpecify(id: id).observe(.value) {(snapshot) in
            if snapshot.exists(), let _ = snapshot.value as? [String: AnyObject] {
                completion?(User(snapshot: snapshot))
            }else {
                completion?(nil)
            }
        }
    }
    
    func usernameExist(username: String, completion: @escaping SuccessCompletion){
        Ref().racineUser.queryOrdered(byChild: "username").queryEqual(toValue: username).observeSingleEvent(of: .value) { (snapshot) in
                if !snapshot.exists() {
                    completion(true, "")
                }else{
                    completion(false, "Le nom de l'utilisateur est déjà pris")
                }
            }
        }
    
    func updateUser(dict: [String: AnyObject], completion: @escaping userCompletion) {
        guard let id = Auth.auth().currentUser?.uid else { completion(nil); return }
        Ref().userSpecify(id: id).updateChildValues(dict) { (error, ref) in
            if error == nil {
                self.verifyUserExist(id: id, completion: { (user) -> (Void) in
                    completion(user)
                })
            }
        }
    }
}
