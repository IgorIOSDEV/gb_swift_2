//
//  NewGroupsViewController.swift
//  VK_App
//
//  Created by Igor Cicej on 27.07.21.
//

import UIKit

class NewGroupsViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: Properties
    private let newID = "NewGroupsID"
    ///массив с группами
    var groups = [Group(name: "Первая группа", image: UIImage(named: "1_Group")),
                  Group(name: "Вторая группа", image:UIImage(named: "2_Group")),
                  Group(name: "Третья группа", image:UIImage(named: "3_Group")),
                  Group(name: "Четвертая группа", image:UIImage(named: "4_Group")),
                  Group(name: "Пятая группа", image:UIImage(named: "5_Group")),
                  Group(name: "Шестая группа", image: UIImage(named: "6_Group")),
                  Group(name: "Седьмая группа", image:UIImage(named: "7_Group")),
                  Group(name: "Восьмая группа", image:UIImage(named: "8_Group"))]
}

extension NewGroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: newID, for: indexPath) as? GroupTableViewCell else {
            fatalError("{ Message: Error in dequeue GroupTableViewCell }")
        }
        cell.groupImage.image = groups[indexPath.row].image
        cell.groupName.text = groups[indexPath.row].name
        return cell
    }
}

extension NewGroupsViewController: UITableViewDelegate {
    
}
