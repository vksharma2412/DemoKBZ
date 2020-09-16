//
//  CategoryViewController.swift
//  demoKBZ
//
//  Created by Vibhishan on 3/12/20.
//  Copyright © 2020 Devloper. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var customNavForCat: cutomNavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
         self.customNavDesignForCat()
         self.addTargetMethod()
    }
    
    func customNavDesignForCat(){
        customNavForCat.searchIcon.image = #imageLiteral(resourceName: "magnifying-glass")
        customNavForCat.profileIconButtonOutlet.imageView?.image = #imageLiteral(resourceName: "user (1)")
        customNavForCat.profileIconButtonOutlet.imageView?.image = #imageLiteral(resourceName: "notification")
    }
  
    func addTargetMethod(){
        customNavForCat.appIconButtonAction.addTarget(self, action: #selector(self.appIconButton), for: .touchUpInside)
        customNavForCat.profileIconButtonAction.addTarget(self, action: #selector(self.profileIconButton), for: .touchUpInside)
        customNavForCat.notificationIconButtonAction.addTarget(self, action: #selector(self.notificationIconButton), for: .touchUpInside)
    }
    
    
    @objc func appIconButton(){
        print("App Icon")
    }
    
    @objc func profileIconButton(){
        print("Profile Icon")
    }
    
    @objc func notificationIconButton(){
        print("notification Icon")
    }
}
