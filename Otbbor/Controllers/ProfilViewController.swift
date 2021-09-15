//
//  ProfilViewController.swift
//  Otbbor
//
//  Created by KS54 on 15.09.2021.
//

import UIKit

class ProfilViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    let imageData = [UIImage(named: "12556223_paisagem15"),
                     UIImage(named: "Unknown-6"),
                     UIImage(named: "sunset-d863fdd4"),
                     UIImage(named: "Unknown-7")
    ]
    let dateData = ["11:00",
                    "15:55",
                    "19:11",
                    "11:11"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        if collectionView.numberOfItems(inSection: 0) - 1  == indexPath.item{
            return collectionView.dequeueReusableCell(withReuseIdentifier: "add", for: indexPath)
        }
        
        cell.imageLabel.image = imageData[indexPath.item]
        cell.timeLabel.text = dateData[indexPath.item]

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.numberOfItems(inSection: 0) - 1  != indexPath.item{
            let vc = storyboard?.instantiateViewController(withIdentifier: "imageView") as! ImageViewController
            vc.image = imageData[indexPath.item]
            
            present(vc, animated: true)
        }
    }

}
