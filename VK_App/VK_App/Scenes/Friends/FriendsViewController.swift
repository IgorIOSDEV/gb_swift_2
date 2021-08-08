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
    var friends = UserStorage.shared.friends

   private let cellID = "FriendsTableViewCell"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showImages",
           let destinationController = segue.destination as? FriendsImagesViewController,
           let indexSelectionCell = friendsTableView.indexPathForSelectedRow {
            let friend = friends[indexSelectionCell.row]
            destinationController.images = friend.images
        }
    }
    var firstCharacters = [Character]()
    var sortedUsers: [Character : [User]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (firstCharacters, sortedUsers) = sort(friends)
    }
}

func sort(_ users: [User]) -> (characters: [Character], sortedUsers: [Character : [User]]) {
    var characters = [Character]()
    var sortedUsers = [Character : [User]]()
    
    users.forEach { User in
        guard let character = User.name.first else { return }
        if var thisCharUsers = sortedUsers[character] {
    
            thisCharUsers.append(User)
            sortedUsers[character] = thisCharUsers
        } else {
            sortedUsers[character] = [User]
            characters.append(character)
        }
    }
    characters.sort()
    return (characters, sortedUsers)
}

extension FriendsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        firstCharacters.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let character = firstCharacters[section]
        let usersCount = sortedUsers[character]?.count
        return usersCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? FriendsTableViewCell else {
            fatalError("{ Message: Error in dequeue \(cellID) }")
        }
        let character = firstCharacters[indexPath.section]
        guard let users = sortedUsers[character] else { return UITableViewCell() }
        cell.configure(with: users[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(firstCharacters[section])
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor .systemTeal.withAlphaComponent(0.5)
    }
  }
extension FriendsViewController: UITableViewDelegate {
    }
