//
//  NewsViewController.swift
//  VK_App
//
//  Created by Igor Cicej on 08.08.21.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet var NewsTableView: UITableView!
    private var newsID = "NewsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var newsList = [
        PostNews(avatar:UIImage(named:"person1"), name: "Ваня Чехов", textNews: "Во Франции около 237 000 человек вышли на общенациональный протест против COVID-сертификатов и обязательной вакцинации медработников. Об этом сообщает DW.", textImage: UIImage(named: "news_1")),
        PostNews(avatar:UIImage(named:"person2"), name: "Ольга Воронина", textNews: "Партия Шведские демократы потребовала от комитета парламента Швеции дать оценку, каким образом министр иностранных дел страны Анн Линде управляет ведомством. Обращение парламентариев поступило после того, как российские пранкеры Владимир Кузнецов (Вован) и Алексей Столяров (Лексус) разыграли Линде.", textImage: UIImage(named: "news_2")),
        PostNews(avatar:UIImage(named:"person3"), name: "Соня Арзанова", textNews: "В Чили будут делать бустерную прививку тем, кто уже вакцинирован от COVID-19 двумя дозами CoronaVac, из-за относительной потери эффективности через несколько месяцев. Об этом заявил президент Чили Себастьян Пиньера.", textImage: UIImage(named: "news_3"))
    ]
    
}
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: newsID, for: indexPath) as! NewsTableViewCell
        //cell.avatarUsersNews.image = UIImage(named: "person1")
        cell.avatarUsersNews.image = newsList[indexPath.row].avatar
        cell.nameUsersNews.text = newsList[indexPath.row].name
        cell.textNews.text = newsList[indexPath.row].textNews
        cell.textNews.numberOfLines = 0
        cell.ImgNews.image = newsList[indexPath.row].textImage
        return cell
        
    }
    
        
    }
    
