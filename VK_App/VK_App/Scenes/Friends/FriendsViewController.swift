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
    var users = UserStorage.shared.users

   private let cellID = "FriendsTableViewCell"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showImages",
           let destinationController = segue.destination as? FriendsImagesViewController,
           let indexSelectionCell = friendsTableView.indexPathForSelectedRow {
            let friend = users[indexSelectionCell.row]
            destinationController.images = friend.images
        }
    }
}

extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? FriendsTableViewCell else {
            fatalError("{ Message: Error in dequeue \(cellID) }")
        }
        cell.configure(with: users[indexPath.row])
        return cell
    }
}

extension FriendsViewController: UITableViewDelegate {
    }
