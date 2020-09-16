//
//  ProductTableView.swift
//  demoKBZ
//
//  Created by Apps on 18/03/20.
//  Copyright © 2020 Devloper. All rights reserved.
//

import UIKit

class ProductTableView: UITableView,UITableViewDelegate,UITableViewDataSource {
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    
    override func numberOfRows(inSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexValue = indexPath.row
        switch indexValue {
        case 0:
            let productShow: ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
                productShow.productHeaderText.text = "New Arrival"
                return productShow
        case 1:
           let productShow: ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
               productShow.productHeaderText.text = "Most Popular"
           productShow.monthText.text = "In March"
              productShow.monthText.backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.6588235294, blue: 0.9137254902, alpha: 0.8470588235)
              return productShow
        case 2:
            let productShow: ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
                productShow.productHeaderText.text = "Deals"
                return productShow
        default:
            return UITableViewCell()
        }
    }
    


}
