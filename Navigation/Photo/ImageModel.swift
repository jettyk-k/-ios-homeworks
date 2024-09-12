//
//  ImageModel.swift
//  Navigation
//
//  Created by Kirill Grunin on 24.05.2022.
//

import UIKit

struct ImageModel {
    var image: String
    
    static func makeImageModel() -> [ImageModel] {
        var image = [ImageModel]()
        
        image.append(ImageModel(image: "1"))
        image.append(ImageModel(image: "2"))
        image.append(ImageModel(image: "3"))
        image.append(ImageModel(image: "4"))
        image.append(ImageModel(image: "5"))
        image.append(ImageModel(image: "6"))
        image.append(ImageModel(image: "7"))
        image.append(ImageModel(image: "8"))
        image.append(ImageModel(image: "9"))
        image.append(ImageModel(image: "10"))
        image.append(ImageModel(image: "11"))
        image.append(ImageModel(image: "12"))
        image.append(ImageModel(image: "13"))
        image.append(ImageModel(image: "14"))
        image.append(ImageModel(image: "15"))
        image.append(ImageModel(image: "16"))
        image.append(ImageModel(image: "17"))
        image.append(ImageModel(image: "18"))
        image.append(ImageModel(image: "19"))
        image.append(ImageModel(image: "20"))
        
        return image
    }
}
