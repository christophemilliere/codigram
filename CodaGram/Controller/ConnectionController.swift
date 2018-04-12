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
    var usernameView: UsernameView!
    var email: String?
    var password: String?
    
    override func viewDidLoad() {
        print("to app")
        super.viewDidLoad()
        view.backgroundColor = .white
        logoVue = LogoVue(frame: view.bounds)
        keyboard()
        connectionVue = ConnectionVue(frame: view.bounds)
        connectionVue.addController(controller: self)
        usernameView = UsernameView(frame: view.bounds)
        usernameView.addController(controller: self)
        view.addSubview(logoVue)
        viewCurrent = logoVue
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let id = Auth.auth().currentUser?.uid{
            //passer à l'application
            verifyUser(id: id)
        }else{
            transition(to: connectionVue, transition: .transitionFlipFromRight)
            //présenterv vue email and password
        }
    }
    
    func validConnection(email: String?, password: String?){
        self.email = email
        self.password = password
        
        if let mail  = self.email, mail != "" {
            if let mdp = self.password, mdp != ""{
                //voir firebase
                Auth.auth().signIn(withEmail: mail, password: mdp, completion: {(user, error) in
                    if let e = error {
                        let nsError = e as NSError
                        if nsError.code == 17011 {
                            Auth.auth().createUser(withEmail: mail, password: mdp, completion: {(user, error) in
                               if let e = error {
                                    Alert().errorSimple(controller: self, message: e.localizedDescription)
                                }
                                if user != nil {
                                    self.transition(to: self.usernameView, transition: .transitionFlipFromRight)
                                }
                            })
                        } else {
                         Alert().errorSimple(controller: self, message: e.localizedDescription)
                        }
                    }
                    if let id = user?.uid {
                        //verify if user exist
                        print("verifyUser")
                        self.verifyUser(id: id)
                    }
                })
            }else{
                // alert
                Alert().errorSimple(controller: self, message: "Le mot de passe ne peut pas être vide")
            }
        }else{
            //montrer une alert
            Alert().errorSimple(controller: self, message: "L'email ne peut pas être vide")
        }
    }
    
    func transition(to: UIView, transition: UIViewAnimationOptions){
        
        UIView.transition(from: viewCurrent, to: to, duration: 1, options: transition) { (success) in
            self.viewCurrent = to
        }
        
    }
    
    func verifyUser(id: String) {
        BDD().verifyUserExist(id: id) { (user) -> Void in
            if user != nil {
                ME = user!
                self.toApp()
            }else{
                self.transition(to: self.usernameView, transition: .transitionFlipFromRight)
            }
        }
    }
    
    func toApp(){
        print("to app")
        let tab = TabBarController()
        self.present(tab, animated: true, completion: nil)
    }
}
