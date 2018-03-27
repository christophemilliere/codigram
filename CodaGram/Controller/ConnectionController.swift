//
//  ConnectionController.swift
//  CodaGram
//
//  Created by christophe milliere on 26/03/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit
import FirebaseAuth

class ConnectionController: UIViewController {
    
    var logoVue: LogoVue!
    var viewCurrent: UIView!
    var connectionVue: ConnectionVue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        logoVue = LogoVue(frame: view.bounds)
        connectionVue = ConnectionVue(frame: view.bounds)
        view.addSubview(logoVue)
        viewCurrent = logoVue
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let id = Auth.auth().currentUser?.uid{
            //passer à l'application
            
        }else{
            transition(to: connectionVue, transition: .transitionFlipFromRight)
            //présenterv vue email and password
        }
    }
    
    func transition(to: UIView, transition: UIViewAnimationOptions){
        
        UIView.transition(from: viewCurrent, to: to, duration: 1, options: transition) { (success) in
            self.viewCurrent = to
        }
        
    }
}
