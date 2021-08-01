//
//  FriendsImagesViewController.swift
//  VK_App
//
//  Created by Igor Cicej on 25.07.21.
//

import UIKit

class FriendsImagesViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    private var resuseID = "FriendsImagesCollectionViewCell"
    
    var images: [FriendImagesModel] = []
    
    
    
}

extension FriendsImagesViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseID, for: indexPath) as! FriendsImagesCollectionViewCell
        
        cell.configure(images[indexPath.row])
        return cell
    }
}

