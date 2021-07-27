//
//  FriendsViewController.swift
//  VK_App
//
//  Created by Igor Cicej on 25.07.21.
//

import UIKit

class FriendsViewController: UIViewController {
    //MARk: - Outlets
    @IBOutlet var friendsTableView: UITableView!
    // MARK: - Properties
    private let cellID = "FriendsTableViewCell"
    /// массив с именами и картинками
    var users = [User(name: "Исаак Ньютон", image: UIImage(named: "1_Newton")),
                 User(name: "Альберт Эйншьтейн", image:UIImage(named: "2_einstein")),
                 User(name: "Джеймс Максвелл", image:UIImage(named: "3_Makswell")),
                 User(name: "Луи Пастер", image:UIImage(named: "4_Paster")),
                 User(name: "Чарльз Дарвин", image:UIImage(named: "5_Darvin")),
                 User(name: "Никола Тесла", image:UIImage(named: "6_Tesla")),
                 User(name: "Нильс Бор", image:UIImage(named: "7_Bor"))]
    
}

extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? FriendsTableViewCell else {
            fatalError("{ Message: Error in dequeue FriendsTableViewCell }")
        }
        
        cell.friendName.text = users[indexPath.row].name
        cell.friendImage.image = users[indexPath.row].image
        return cell
    }
}

extension FriendsViewController: UITableViewDelegate {
    }
