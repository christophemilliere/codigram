//
//  logoVue.swift
//  CodaGram
//
//  Created by christophe milliere on 26/03/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

class LogoVue: UIView {

    var logoImageVue: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        miseEnPlace()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        miseEnPlace()
    }
    
    func miseEnPlace(){
        logoImageVue = UIImageView(frame: CGRect(x: 20, y: 0, width: frame.width - 40, height: frame.height))
        logoImageVue.image = #imageLiteral(resourceName: "logo")
        logoImageVue.contentMode = .scaleAspectFit
        logoImageVue.clipsToBounds = true
        
        addSubview(logoImageVue)
    }

}
