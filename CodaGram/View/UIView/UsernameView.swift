//
//  UsernameView.swift
//  CodaGram
//
//  Created by christophe milliere on 07/04/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

class UsernameView: UIView {
    var vue: UIView!

    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var connectionController : ConnectionController!
    
    var createUsername = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        vue = chargerXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        vue = chargerXib()
    }
    
    func addController(controller: ConnectionController) {
        self.connectionController = controller
        UsernameTextField.addTarget(self, action: #selector(textUpdate), for: .editingChanged)
    }

    @IBAction func backButton(_ sender: Any) {
        connectionController?.transition(to: (connectionController?.connectionVue)!, transition: .transitionFlipFromLeft)
    }
    @IBAction func validAction(_ sender: Any) {
        if UsernameTextField.text != nil, createUsername {
            BDD().updateUser(dict: ["username" : UsernameTextField.text! as AnyObject], completion: { (user) -> (Void) in
                if user != nil {
                    ME = user!
                    self.connectionController.toApp()
                }
            })
        }
    }
    
    @objc func textUpdate(_ textField: UITextView) {
        guard let newUsername = textField.text else { return }
        if newUsername == "" {
            createUsername = false
            errorLabel.text = "Le nom de l'utilisateur ne peut pas être vide"
        } else if newUsername.contains(" ") {
            createUsername = false
            errorLabel.text = "Le nom de l'utilisateur ne peut pas contenir d'espace"
        } else if newUsername.count >= 20 {
            createUsername = false
            errorLabel.text = "Le nom de l'utilisateur est trop long"
        } else {
            BDD().usernameExist(username: newUsername, completion: { (success, error) -> (Void) in
                guard success  != nil, error != nil else { return }
                self.createUsername = success!
                self.errorLabel.text = error!
            })
        }
    }
}
