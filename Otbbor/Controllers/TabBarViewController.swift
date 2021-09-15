//
//  TabBarViewController.swift
//  Otbbor
//
//  Created by KS54 on 15.09.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    @IBOutlet weak var mTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mTabBar.backgroundColor = UIColor.clear
        mTabBar.backgroundImage = UIImage()
        mTabBar.shadowImage = UIImage()
        
        mTabBar.barTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        mTabBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    
}
