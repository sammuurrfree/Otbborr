//
//  File.swift
//  Otbbor
//
//  Created by KS54 on 16.09.2021.
//

import Foundation
import UIKit

struct ImageModel: Encodable, Decodable{
    var image: Data?
    var time: String
}

class Image {
    
    let userDefoalts = UserDefaults()
    
    func getImages() -> [ImageModel] {
        if !userDefoalts.bool(forKey: "isOne"){
            let images = [ImageModel(image: UIImage(named: "12556223_paisagem15")?.pngData(), time: "11:00"),
                              ImageModel(image: UIImage(named: "Unknown-6")?.pngData(), time: "15:55"),
                              ImageModel(image: UIImage(named: "sunset-d863fdd4")?.pngData(), time: "19:11"),
                              ImageModel(image: UIImage(named: "Unknown-7")?.pngData(), time: "11:11")
            ]
            userDefoalts.set(try? PropertyListEncoder().encode(images) , forKey: "imagesArray")
            userDefoalts.set(true, forKey: "isOne")
            
            return images
        }else{
            if let data = UserDefaults.standard.value(forKey:"imagesArray") as? Data {
                let images = try? PropertyListDecoder().decode([ImageModel].self, from: data)
                return images!
            }
            return userDefoalts.object(forKey: "imagesArray") as! [ImageModel]
        }
    }
    
    func deleteImage(number: Int) {
        
        var images = getImages()
        images.remove(at: number)
        
        userDefoalts.set(try? PropertyListEncoder().encode(images) , forKey: "imagesArray")
    }
    
    func addImage(image: UIImage) {
        
        var images = getImages()
        let calendar = Calendar.current
        let time = "\(calendar.component(.hour, from: Date())):\(calendar.component(.minute, from: Date()))"
        
        images.append(ImageModel(image: image.pngData(), time: time))
        userDefoalts.set(try? PropertyListEncoder().encode(images) , forKey: "imagesArray")
    }
    
}
