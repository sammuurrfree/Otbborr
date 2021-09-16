//
//  MainViewController.swift
//  Otbbor
//
//  Created by KS54 on 15.09.2021.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource{
    
    
    @IBOutlet weak var userTitle: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet var collectionview1: UICollectionView!
    
    var feelingsData = Feelings().getFeelings()?.data
    var quotesData = Quotes().getFeelings()?.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if globalUser != nil{
            userTitle.text = "С возвращением, \(globalUser!.nickName!)!"
            userImage.image = UIImage(data:try! Data(contentsOf: URL(string: globalUser!.avatar!)!))
        }
        
        feelingsData?.sort(by: { a, b in
            a.position < b.position
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !Reachability.isConnectedToNetwork() {
            let alert = UIAlertController(title: "Error conection", message: "Ошибка подключения к серверу", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "ok", style: .default))
            self.present(alert, animated: true)
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionview1{
            return feelingsData?.count ?? 0
        }else{
            return quotesData?.count ?? 0
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionview1{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeelingCollectionViewCell", for: indexPath) as! FeelingCollectionViewCell
            cell.title.text =  feelingsData![indexPath.item].title
            cell.image.image = UIImage(data:try! Data(contentsOf: URL(string: feelingsData![indexPath.item].image )!))
            
            return cell
            
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuotesCollectionViewCell", for: indexPath) as! QuotesCollectionViewCell
            cell.title.text =  quotesData![indexPath.item].title
            cell.image.image = UIImage(data:try! Data(contentsOf: URL(string: quotesData![indexPath.item].image )!))
            cell.descriptonLabel.text = quotesData![indexPath.item].description
            
            return cell
        }
    }
    
    
    
}
