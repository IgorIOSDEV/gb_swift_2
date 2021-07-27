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
    let friends: [User] = []
    var users = [User(name: "Исаак Ньютон", image: UIImage(named: "1_Newton")),
                 User(name: "Альберт Эйншьтейн", image:UIImage(named: "2_einstein")),
                 User(name: "Джеймс Максвелл", image:UIImage(named: "3_Makswell")),
                 User(name: "Луи Пастер", image:UIImage(named: "4_Paster")),
                 User(name: "Чарльз Дарвин", image:UIImage(named: "5_Darvin")),
                 User(name: "Никола Тесла", image:UIImage(named: "6_Tesla")),
                 User(name: "Нильс Бор", image:UIImage(named: "7_Bor"))]
}

extension FriendsImagesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseID, for: indexPath) as? FriendsImagesCollectionViewCell
        else {fatalError("{ Message: Error in dequeue FriendsTableViewCell }")
        }
        
        cell.collectionImage.image = users[indexPath.row].image
        return cell
    }
    
    
}
