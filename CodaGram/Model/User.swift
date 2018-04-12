
//
//  User.swift
//  CodaGram
//
//  Created by christophe milliere on 04/04/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit
import FirebaseDatabase

class User {
    private var _ref: DatabaseReference!
    private var _id: String!
    private var _username: String!
    private var _firstname: String!
    private var _lastname: String!
    private var _desc: String!
    private var _imageUrl: String!
    private var _follows: [String]!
    private var _subscriptions: [String]!
    
    var ref: DatabaseReference { return _ref }
    var id: String { return _id }
    var username: String { return _username }
    var firstname: String { return _firstname }
    var lastname: String {return _lastname }
    var desc: String { return _desc }
    var imageUrl: String { return _imageUrl }
    var follows: [String] { return _follows }
    var subscriptions: [String] { return _subscriptions }
    
    init(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: AnyObject] else { return }
        self._ref = snapshot.ref
        self._id = snapshot.key
        self._username = dict["username"] as? String ?? ""
        self._firstname = dict["firstname"] as? String ?? ""
        self._lastname = dict["lastname"] as? String ?? ""
        self._desc = dict["desc"] as? String ?? ""
        self._imageUrl = dict["imageUrl"] as? String ?? ""
        self._follows = dict["follows"] as? [String] ?? []
        self._subscriptions = dict["subscriptions"] as? [String] ?? []
        
        
    }
    
    
}
