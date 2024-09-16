//
//  PostModel.swift
//  Navigation
//
//  Created by Kirill Grunin on 24.05.2022.
//

import UIKit

struct PostModel {
    let author: String 
    var description: String?
    var image: UIImage
    var likes: Int
    var views: Int
    
    static func makePostModel() -> [PostModel] {
        
        var model = [PostModel]()
        
        model.append(PostModel(author: "MiaVia", description: "Ждун сегодня", image: UIImage(named: "theWaitingThing1")!, likes: 456, views: 1223))
        model.append(PostModel(author: "Zanoza12345", description: "Ну-с, подождем поезд", image: UIImage(named: "theWaitingThing2")!, likes: 156, views: 453))
        model.append(PostModel(author: "bulberit", description: "Sсi-Fi Ждун⁠⁠", image: UIImage(named: "theWaitingThing3")!, likes: 156, views: 453))
        model.append(PostModel(author: "logio2", description: "В ожидании", image: UIImage(named: "theWaitingThing4")!, likes: 226, views: 345))
        
        return model
    }
}

