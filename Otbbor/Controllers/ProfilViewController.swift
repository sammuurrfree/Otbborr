//
//  ProfilViewController.swift
//  Otbbor
//
//  Created by KS54 on 15.09.2021.
//

import UIKit

protocol Update {
    func update()
}



class ProfilViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, Update{
  
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    var imagePicer = UIImagePickerController()
    
    var dataBase = Image().getImages()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if globalUser != nil{
            name.text = "\(globalUser!.nickName!)"
            image.image = UIImage(data:try! Data(contentsOf: URL(string: globalUser!.avatar!)!))
        }
    }
    
    func update() {
        collectionView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataBase.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        if collectionView.numberOfItems(inSection: 0) - 1  == indexPath.item{
            return collectionView.dequeueReusableCell(withReuseIdentifier: "add", for: indexPath)
        }
        
        cell.imageLabel.image = UIImage(data:  dataBase[indexPath.item].image!)
        cell.timeLabel.text = dataBase[indexPath.item].time

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.numberOfItems(inSection: 0) - 1  != indexPath.item{
            let vc = storyboard?.instantiateViewController(withIdentifier: "imageView") as! ImageViewController
            vc.image = indexPath.item
            vc.dataBase = dataBase
            vc.delegate = self
            
            present(vc, animated: true)
        }else{
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                
                imagePicer.delegate = self
                imagePicer.sourceType = .photoLibrary
                imagePicer.allowsEditing = false
                
                present(imagePicer, animated: true)
            }
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            Image().addImage(image: image)
            dataBase = Image().getImages()
            
            collectionView.reloadData()
        }

        self.imagePicer.dismiss(animated: true)
    }

}
