//
//  UIExtensions.swift
//  CodaGram
//
//  Created by christophe milliere on 26/03/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

extension UIView {
    func chargerXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nomXib = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nomXib, bundle: bundle)
        print(nomXib)
        let vue = nib.instantiate(withOwner: self, options: nil).first as! UIView
        vue.frame = bounds
        addSubview(vue)
        vue.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundColor = .red
        return vue
    }
}
