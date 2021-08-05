//
//  FriendsImagesCollectionViewCell.swift
//  VK_App
//
//  Created by Igor Cicej on 25.07.21.
//

import UIKit

class FriendsImagesCollectionViewCell: UICollectionViewCell {
    
    let identifier = "FriendsImagesCollectionViewCell"
   
    @IBOutlet private var collectionImage: UIImageView!
    @IBOutlet private var heartImageView: UIImageView!
    @IBOutlet private var countLikeLable: UILabel!
    
    public var isHeartFilled = false {
        didSet {
            if !isHeartFilled {
                heartImageView.image = HeartsCondition.emptyHeart
            } else {
                heartImageView.image = HeartsCondition.fillHeart
            }
        }
    }
    
    public var heartWasPressed = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        heartImageView.image = HeartsCondition.emptyHeart
        countLikeLable.text = "0"
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(heartTap))
        heartImageView.addGestureRecognizer(tapGR)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        heartImageView.image = HeartsCondition.emptyHeart
    }
    
    private struct HeartsCondition {
        static let emptyHeart = UIImage(named: "dheartEmpty")
        static let fillHeart = UIImage(named: "dheartFilled")
    }
    
    @objc func heartTap() {
        isHeartFilled.toggle()
        heartWasPressed()
        
        let countLikes = Int(countLikeLable.text ?? "0") ?? 0
        if isHeartFilled {
            countLikeLable.text = String(countLikes + 1)
        } else {
            countLikeLable.text = String(countLikes - 1)
        }
    }
    
    func configure(_ user: FriendImagesModel) {
    collectionImage.image = UIImage(named: user.images)
    }
}

