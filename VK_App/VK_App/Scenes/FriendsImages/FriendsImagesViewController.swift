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
}

extension FriendsImagesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseID, for: indexPath) as? FriendsImagesCollectionViewCell
        else {fatalError("{ Message: Error in dequeue FriendsTableViewCell }")
        }
        return cell
    }
    
    
}
