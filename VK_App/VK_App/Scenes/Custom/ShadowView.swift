//
//  ShadowView.swift
//  VK_App
//
//  Created by Igor Cicej on 01.08.21.
//

import UIKit

extension UIView {
    
    func addShadow (offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float){
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGcolor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor = backgroundCGcolor
    }
}

    @IBDesignable class ShadowView: UIView {
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            updateShadowColor()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            updateShadowRadius()
        }
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.width / 2).cgPath
        
    }

    private func commonInit() {
        updateShadowColor()
        updateShadowRadius()
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
    }
    
    private func updateShadowColor() {
        layer.shadowColor = shadowColor.cgColor
    }
    
    private func updateShadowRadius() {
        layer.shadowRadius = shadowRadius
    }
}
   
