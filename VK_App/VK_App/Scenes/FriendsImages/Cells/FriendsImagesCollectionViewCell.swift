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
   
    func configure(_ user: FriendImagesModel) {
    collectionImage.image = UIImage(named: user.images)
    }
}

