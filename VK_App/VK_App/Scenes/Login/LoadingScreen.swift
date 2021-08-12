//
//  LoadingScreen.swift
//  VK_App
//
//  Created by Igor Cicej on 11.08.21.
//

import UIKit

class LoadingScreen: UIViewController {

    @IBOutlet var AnimationView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dotOne = UIView()
        let dotTwo = UIView()
        let dotThree = UIView()
        
        let radius = 15
        
        dotOne.layer.cornerRadius = CGFloat(radius / 2)
        dotTwo.layer.cornerRadius = CGFloat(radius / 2)
        dotThree.layer.cornerRadius = CGFloat(radius / 2)
        
        dotOne.backgroundColor = .systemTeal
        dotTwo.backgroundColor = .systemTeal
        dotThree.backgroundColor = .systemTeal
        
        AnimationView.addSubview(dotOne)
        AnimationView.addSubview(dotTwo)
        AnimationView.addSubview(dotThree)
        
        dotOne.translatesAutoresizingMaskIntoConstraints = false
        dotTwo.translatesAutoresizingMaskIntoConstraints = false
        dotThree.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dotOne.centerYAnchor.constraint(equalTo: AnimationView.centerYAnchor),
            dotOne.centerXAnchor.constraint(equalTo: AnimationView.centerXAnchor, constant: -30),
            dotOne.widthAnchor.constraint(equalToConstant: CGFloat(radius)),
            dotOne.heightAnchor.constraint(equalToConstant: CGFloat(radius)),
            dotTwo.centerYAnchor.constraint(equalTo: AnimationView.centerYAnchor),
            dotTwo.centerXAnchor.constraint(equalTo: AnimationView.centerXAnchor, constant: 0),
            dotTwo.widthAnchor.constraint(equalToConstant: CGFloat(radius)),
            dotTwo.heightAnchor.constraint(equalToConstant: CGFloat(radius)),
            dotThree.centerYAnchor.constraint(equalTo: AnimationView.centerYAnchor),
            dotThree.centerXAnchor.constraint(equalTo: AnimationView.centerXAnchor, constant: 30),
            dotThree.widthAnchor.constraint(equalToConstant: CGFloat(radius)),
            dotThree.heightAnchor.constraint(equalToConstant: CGFloat(radius))
            ])
        
        let animation = 0.7
        
        UIView.animate(withDuration: animation, animations: {dotOne.alpha = 0}, completion: {_ in
            UIView.animate(withDuration: animation, animations: {dotTwo.alpha = 0}, completion: {_ in
                UIView.animate(withDuration: animation, animations: {dotThree.alpha = 0}, completion: {_ in
                                self.performSegue(withIdentifier: "log", sender: self)
                })
            })
        })
    }
}
