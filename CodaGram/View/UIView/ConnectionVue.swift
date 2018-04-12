//
//  ConnectionVue.swift
//  CodaGram
//
//  Created by christophe milliere on 26/03/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

class ConnectionVue: UIView {
    
    
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var validButton: CodaGrammButton!
    
    
    var vue: UIView!
    var connectionController : ConnectionController!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        vue = chargerXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        vue = chargerXib()
    }
    
    func addController(controller: ConnectionController){
        self.connectionController = controller
    }
    
    @IBAction func validButtonAction(_ sender: Any) {
        connectionController?.validConnection(email: mailTextField.text, password: passwordTextfield.text)
    }
    
    
}
