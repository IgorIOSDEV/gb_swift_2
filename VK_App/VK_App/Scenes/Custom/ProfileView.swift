//
//  ProfileView.swift
//  VK_App
//
//  Created by Igor Cicej on 10.08.21.
//

import UIKit

class ProfileView: UIView {

    @IBDesignable class ProfileView: UIView {

        override init(frame:CGRect) {
            super.init(frame: frame)
            tapOnView()
            
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            tapOnView()
            
        }
        
        func tapOnView() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        recognizer.numberOfTapsRequired = 1
            self.addGestureRecognizer(recognizer)
    }
        @objc func onTap(gestureRecognizer: UITapGestureRecognizer) {
            let original = self.transform
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.1, options: [ .autoreverse], animations: {
                self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }, completion: { _ in self.transform = original})
        }
    }
}

