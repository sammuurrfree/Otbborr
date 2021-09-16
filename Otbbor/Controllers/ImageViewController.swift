//
//  ImageViewController.swift
//  Otbbor
//
//  Created by ADMIMN on 15.09.2021.
//

import UIKit

class ImageViewController: UIViewController {


    @IBOutlet var imageView: UIImageView!
    var image:Int = -1
    var dataBase: [ImageModel]? = nil
    var delegate: Update? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(data: dataBase![image].image!)
    }

    @IBAction func deleteImage(_ sender: UIButton) {
        Image().deleteImage(number: image)
        delegate?.update()
        let vc = storyboard?.instantiateViewController(withIdentifier: "main")
        
        present(vc!, animated: true)
        
    }
    
    
    
}
