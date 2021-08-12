//
//  FriendsTableViewCell.swift
//  VK_App
//
//  Created by Igor Cicej on 25.07.21.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet private var friendImage: UIImageView!
    @IBOutlet private var friendName: UILabel!
    
    let identifier = "FriendsImagesCollectionViewCell"
    
   

    //MARK  Methods
    func configure(with friend: User) {
        friendName.text = friend.name
        friendImage.image = friend.image
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

}



