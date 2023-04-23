//
//  Extension.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 23/04/2023.
//

import UIKit

extension UIView {
    func addBottomShadow() {
        backgroundColor = .white
        layer.masksToBounds = false
        layer.shadowRadius = 2
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0 , height:2)
    }
    
    
//    func addTopShadow(shadowColor : UIColor, shadowOpacity : Float,shadowRadius : Float, offset:CGSize){
//        self.layer.shadowColor = shadowColor.cgColor
//        self.layer.shadowOffset = offset
//        self.layer.shadowOpacity = shadowOpacity
//        self.layer.shadowRadius = CGFloat(shadowRadius)
//        self.clipsToBounds = false
        
        
//    }
    
    func addTopShadow(){
        backgroundColor = .white
        layer.masksToBounds = false
        layer.shadowRadius = 2
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0 , height:-2)
    }

}
