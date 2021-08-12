//
//  LikeButton.swift
//  VK_App
//
//  Created by Igor Cicej on 08.08.21.
//

import UIKit
import Foundation

class LikeButton: UIButton {
    var counter = Int.random(in:0...99)
    var liked = false
    
    //MARK: UIButton
    
    public override init(frame:CGRect) {
        super.init(frame: frame)
        setNeedsDisplay()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setNeedsDisplay()
    }
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }

    //MARK: Internal Methods
    
    private func configure() {
        self.setTitle("\(liked ? "♥" : "♡") \(counter)", for: .normal)
        self.backgroundColor = liked ? UIColor.systemRed : UIColor.clear
        self.setTitleColor(liked ? UIColor.white : UIColor.gray, for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = 8.0
        
        addTarget(self, action: #selector(onTap(_:)), for: .touchUpInside)
    }
    
    @objc func onTap(_ sender:UIButton) {
        self.liked.toggle()
        self.counter += liked ? 1 : -1
        
        LikeButton.animate(withDuration: 0.25, delay: 0,
                           usingSpringWithDamping: 0.75, initialSpringVelocity: 0.25, options: [], animations: {self.transform = CGAffineTransform(rotationAngle: (CGFloat.pi / 16) * (self.liked ? -1 :1))},completion:
                            {_ in
                            LikeButton.animate(withDuration: 0.25, delay: 0,  options: [.allowUserInteraction], animations: {self.transform = CGAffineTransform(rotationAngle: 0)}, completion:nil)
        })
    }
}
