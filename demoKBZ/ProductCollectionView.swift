//
//  ProductCollectionView.swift
//  demoKBZ
//
//  Created by Apps on 18/03/20.
//  Copyright © 2020 Devloper. All rights reserved.
//

import UIKit

class ProductCollectionView: UICollectionView,UICollectionViewDataSource,UICollectionViewDelegate {
   
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 10
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let producShow: ProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        return producShow
       }
       
}
