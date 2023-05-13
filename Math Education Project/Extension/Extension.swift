//
//  Extension.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 23/04/2023.
//

import UIKit

class TaggedTapGestureRecognizer: UITapGestureRecognizer {
    var tag: Int = 0
}

class GradientView: UIView {

    private let gradient : CAGradientLayer = CAGradientLayer()
    private let gradientStartColor: UIColor
    private let gradientEndColor: UIColor

    init(gradientStartColor: UIColor, gradientEndColor: UIColor) {
        self.gradientStartColor = gradientStartColor
        self.gradientEndColor = gradientEndColor
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradient.frame = self.bounds
    }

    override public func draw(_ rect: CGRect) {
        gradient.frame = self.bounds
        gradient.colors = [gradientEndColor.cgColor, gradientStartColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.85, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 0)
        if gradient.superlayer == nil {
            layer.insertSublayer(gradient, at: 0)
        }
    }
}


extension UIView {
    func addBottomShadow() {
        backgroundColor = .white
        layer.masksToBounds = false
        layer.shadowRadius = 2
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0 , height:2)
    }
    
    func addTopShadow(){
        backgroundColor = .white
        layer.masksToBounds = false
        layer.shadowRadius = 2
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0 , height:-2)
    }

}
