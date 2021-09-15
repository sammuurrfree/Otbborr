//
//  MainViewController.swift
//  Otbbor
//
//  Created by KS54 on 15.09.2021.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource{
    
    
  

    
    var feelingsData = Feelings().getFeelings()?.data
    var quotesData = Quotes().getFeelings()?.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView{
            return feelingsData?.count ?? 0
        }else{
            return quotesData?.count ?? 0
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionView{
            
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
