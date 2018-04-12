//
//  CodaGrammButton.swift
//  CodaGram
//
//  Created by christophe milliere on 01/04/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

class CodaGrammButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        miseEnPlace()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        miseEnPlace()
    }
    
    func miseEnPlace(){
        layer.cornerRadius = 5
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1
        backgroundColor = .white
        tintColor = .darkGray
    }
}
