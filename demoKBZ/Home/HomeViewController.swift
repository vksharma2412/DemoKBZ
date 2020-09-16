//  HomeViewController.swift
//  demoKBZ
//
//  Created by Vibhishan on 3/12/20.
//  Copyright © 2020 Devloper. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class HomeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    @IBOutlet weak var customTabNav: cutomNavigationBar!
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    @IBOutlet weak var pageView: UIPageControl!
    @IBAction func pageViewAction(_ sender: UIPageControl) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customNavDesign()
        self.addTargetMethod()
        self.paginationMethod()
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (Timer) in
                 self.changeImage()
            })
        }
        
    }
   var data = ["Hello", "Hiii", "Khelo"]
   var arrSliderData = [#imageLiteral(resourceName: "banner-1"), #imageLiteral(resourceName: "banner-1"), #imageLiteral(resourceName: "banner-1"), #imageLiteral(resourceName: "banner-1"), #imageLiteral(resourceName: "banner-1"), #imageLiteral(resourceName: "banner-1"),#imageLiteral(resourceName: "banner-1")]
   var timer = Timer()
   var counter = 0
    
    func customNavDesign(){
        customTabNav.searchIcon.image = #imageLiteral(resourceName: "magnifying-glass")
        customTabNav.profileIconButtonOutlet.imageView?.image = #imageLiteral(resourceName: "user (1)")
        customTabNav.profileIconButtonOutlet.imageView?.image = #imageLiteral(resourceName: "notification")
    }
   
    func addTargetMethod(){
         customTabNav.appIconButtonAction.addTarget(self, action: #selector(self.appIconButton), for: .touchUpInside)
        customTabNav.profileIconButtonAction.addTarget(self, action: #selector(self.profileIconButton), for: .touchUpInside)
        customTabNav.notificationIconButtonAction.addTarget(self, action: #selector(self.notificationIconButton), for: .touchUpInside)
    }
    
    
    @objc func appIconButton(){
        print("App Icon")
    }
    
    @objc func profileIconButton(){
        let naviToLogIn = self.storyboard?.instantiateViewController(identifier: "LogIn")
        self.navigationController?.pushViewController(naviToLogIn!, animated: true)
    }
    
    @objc func notificationIconButton(){
        print("notification Icon")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSliderData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sliderData: sliderCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCollection", for: indexPath) as! sliderCollectionViewCell
            sliderData.sliderImage.image = arrSliderData[indexPath.row]
        return sliderData
    }
    
    func paginationMethod(){
        pageView.numberOfPages = self.arrSliderData.count
        pageView.currentPage = 0
    }
    
    func changeImage(){
        if counter < arrSliderData.count{
            let index = IndexPath.init(item:counter, section: 0)
            self.sliderCollectionView.scrollToItem(at:index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
            counter += 1
        }else{
            counter = 0
            let index = IndexPath.init(item:counter, section: 0)
            self.sliderCollectionView.scrollToItem(at:index, at: .centeredHorizontally, animated: false)
            pageView.currentPage = counter
            counter = 1
        }
    }
    
    
}
