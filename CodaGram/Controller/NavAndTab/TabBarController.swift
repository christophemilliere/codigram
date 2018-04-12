//
//  TabBarController.swift
//  CodaGram
//
//  Created by christophe milliere on 09/04/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let fil = filController(collectionViewLayout: layout)
        let notif = NotificationController(style: .plain)
        let profil = ProfilController(collectionViewLayout: layout)
        
        viewControllers = [
            add(controller: fil, image: #imageLiteral(resourceName: "tab_accueil"), title: "Acceuil"),
            add(controller: SearchController(), image: #imageLiteral(resourceName: "Search"), title: "Search"),
            add(controller: PhotoController(), image: #imageLiteral(resourceName: "tab_photo"), title: ""),
            add(controller: notif, image: #imageLiteral(resourceName: "tab_notif"), title: "Notifications"),
            add(controller: profil, image: #imageLiteral(resourceName: "profil"), title: "Profil")
        ]
    }
    
    func add(controller: UIViewController, image: UIImage, title: String) -> UINavigationController {
        let nav = NavController(rootViewController: controller)
        nav.tabBarItem.image = image
        nav.tabBarItem.title = title
        return nav
    }
}
