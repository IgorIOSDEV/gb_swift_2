//
//  CurrentGroupsViewController.swift
//  VK_App
//
//  Created by Igor Cicej on 27.07.21.
//

import UIKit

class CurrentGroupsViewController: UIViewController {
    // MARK: Outlets
    /// таблица с группами
    @IBOutlet var groupsTableView: UITableView!
    // MARK: Properties
    private let groupCellID = "GroupTableViewCell"
    ///массив с группами
    var groups = [Group(name: "Первая группа", image: UIImage(named: "1_Group")),
                  Group(name: "Вторая группа", image:UIImage(named: "2_Group")),
                  Group(name: "Третья группа", image:UIImage(named: "3_Group"))]

    @IBAction func goBackFromAvalibleScreen(with seque: UIStoryboardSegue) {
        guard let avalibleVC = seque.source as? NewGroupsViewController,
              let indexPath = avalibleVC.tableView.indexPathForSelectedRow else { return }
        let newGroup = avalibleVC.groups[indexPath.row]
        
        guard !groups.contains(where: { group -> Bool in
            group.name == newGroup.name
        }) else {return}
        
        groups.append(newGroup)
        groupsTableView.reloadData()
    }

}

extension CurrentGroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: groupCellID, for: indexPath) as? GroupTableViewCell else {
            fatalError("{ Message: Error in dequeue GroupTableViewCell }")
        }
        cell.groupImage.image = groups[indexPath.row].image
        cell.groupName.text = groups[indexPath.row].name
        return cell
    }
}
    
//удаление группы из списка
extension CurrentGroupsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            _ = groups[indexPath.row]
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            return
        }
    }
}
