//
//  ImageModel.swift
//  Navigation
//
//  Created by Kirill Grunin on 24.05.2022.
//

import UIKit

struct PhotoGalery {
    var image: String
    
    static func makeImageModel() -> [PhotoGalery] {
        var image = [PhotoGalery]()
        for i in 1...20 {
            image.append(PhotoGalery(image: "\(i)"))
        }
        return image
    }
}
