//
//  Ref.swift
//  CodaGram
//
//  Created by christophe milliere on 07/04/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class Ref {
    let bdd  = Database.database().reference()
    let storage = Storage.storage().reference()
    
    var racineUser: DatabaseReference{ return bdd.child("user") }
    func userSpecify(id: String) -> DatabaseReference {
        return racineUser.child(id)
    }
}
