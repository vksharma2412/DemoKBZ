//
//  MyCartViewController.swift
//  demoKBZ
//
//  Created by Vibhishan on 3/12/20.
//  Copyright © 2020 Devloper. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class MyCartViewController: UIViewController {

    @IBOutlet weak var checkButtonOutlet: UIButton!
    
    @IBAction func checkButtonAction(_ sender: UIButton) {
        sender.setImage(UIImage(named: "app"), for: UIControl.State.normal)
    }
   
    @IBOutlet weak var shopNow: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shopNowDesign()
    }
    

    func shopNowDesign(){
       self.shopNow.layer.cornerRadius = 5
        self.shopNow.layer.borderColor = #colorLiteral(red: 0.01960784314, green: 0.1607843137, blue: 0.4274509804, alpha: 1)
        self.shopNow.layer.borderWidth = 1
    }
    
    
    @IBAction func shopNowAction(_ sender: UIButton) {
        let naviToHome: KbzBottomTabBarController = self.storyboard?.instantiateViewController(identifier: "kbzTabBar") as! KbzBottomTabBarController
     self.navigationController?.pushViewController(naviToHome, animated: true)
    }
    
}

