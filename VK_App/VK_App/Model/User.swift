//
//  User.swift
//  VK_App
//
//  Created by Igor Cicej on 26.07.21.
//

import UIKit

struct User {
    let name: String
    let image: UIImage?
    let images: [FriendImagesModel]
}
struct UserStorage {
    
    static let shared = UserStorage()
    
    var friends: [User]
   
    private init() {
        friends = [User(name: "Исаак Ньютон", image:UIImage(named:"1_Newton"), images: [FriendImagesModel( images :"1_Newton")]),
                 User(name: "Альберт Эйншьтейн", image:UIImage(named: "2_einstein"), images: [FriendImagesModel( images :"2_einstein")]),
                 User(name: "Джеймс Максвелл", image:UIImage(named: "3_Makswell"), images: [FriendImagesModel( images :"3_Makswell")]),
                 User(name: "Луи Пастер", image:UIImage(named: "4_Paster"), images: [FriendImagesModel( images :"4_Paster")]),
                 User(name: "Чарльз Дарвин", image:UIImage(named: "5_Darvin"), images: [FriendImagesModel( images :"5_Darvin")]),
                 User(name: "Никола Тесла", image:UIImage(named: "6_Tesla"), images: [FriendImagesModel( images :"6_Tesla")]),
                 User(name: "Нильс Бор", image:UIImage(named: "7_Bor"), images: [FriendImagesModel( images :"7_Bor")])]
    }
}
