//
//  Alert.swift
//  CodaGram
//
//  Created by christophe milliere on 01/04/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

class Alert{
    func errorSimple(controller: UIViewController, message: String?){
        let alert = UIAlertController(title: "Erreur", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
        
    }
}

