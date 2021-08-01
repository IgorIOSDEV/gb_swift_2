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

    @IBDesignable public class ShadowView: UIView {
        var image: UIImage?
    
    init(size: CGFloat = 60, shadowRadius: CGFloat = 4.0, shadowOpacity: CGFloat = 0.5, shadowColor: UIColor = UIColor.black){
        super.init(frame: CGRect(x: 0, y: 0, width: size, height: size))
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBInspectable var shadowRadius: CGFloat = 4.0 {
        didSet {setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet {setNeedsLayout()
        }
    }

    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet {setNeedsLayout()
        }
    }
    
        override public func layoutSubviews() {
            super.layoutSubviews()
            
            let imageContent = UIImageView()
            imageContent.image = image
            imageContent.frame = bounds.insetBy(dx: 15, dy: 15)
            imageContent.layer.cornerRadius = imageContent.bounds.width / 2
            imageContent.clipsToBounds = true
            addSubview(imageContent)
            
            backgroundColor = UIColor.clear
            layer.cornerRadius = bounds.width / 2
            
            addShadow(offset: CGSize(width: 0, height: 0), color: shadowColor, radius: shadowRadius, opacity: shadowOpacity)
        }
    }

