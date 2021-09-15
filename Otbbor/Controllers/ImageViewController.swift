//
//  ImageViewController.swift
//  Otbbor
//
//  Created by ADMIMN on 15.09.2021.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var image:UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
    }


    
    
}
