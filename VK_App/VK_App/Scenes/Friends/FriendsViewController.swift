//
//  FriendsViewController.swift
//  VK_App
//
//  Created by Igor Cicej on 25.07.21.
//

import UIKit

class FriendsViewController: UIViewController {

    //MARk: - Outlets
    
    
    @IBOutlet weak var friendsTableView: UITableView!
    // MARK: - Properties
    private let cellID = "FriendsTableViewCell"
}


extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? FriendsTableViewCell else {
            fatalError("{ Message: Error in dequeue FriendsTableViewCell }")
        }
        
        return cell
        //cell.friendImage.image
        //cell.friendName.text
    }
    
    
    
}

extension FriendsViewController: UITableViewDelegate {
    
}
