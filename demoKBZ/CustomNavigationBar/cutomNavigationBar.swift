//
//  cutomNavigationBar.swift
//  demoKBZ
//
//  Created by Vibhishan on 3/12/20.
//  Copyright © 2020 Devloper. All rights reserved.
//

import UIKit

class cutomNavigationBar: UIView {
   
    
    @IBOutlet var mainContainerView: UIView!
   
    @IBOutlet weak var appIconButtonOutlet: UIButton!
    
    @IBOutlet weak var appIconButtonAction: UIButton!
    
    @IBOutlet weak var textFieldContainer: UIView!
    
    @IBOutlet weak var searchIcon: UIImageView!
     @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var profileIconButtonOutlet: UIButton!
    @IBOutlet weak var profileIconButtonAction: UIButton!
    
    @IBOutlet weak var notificationIconButtonOutlet: UIButton!
    
    @IBOutlet weak var notificationIconButtonAction: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        commitInit()
        textFieldContainer.layer.cornerRadius = 5
        textFieldContainer.layer.borderWidth = 1
        textFieldContainer.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commitInit()
        textFieldContainer.layer.cornerRadius = 5
        textFieldContainer.layer.borderWidth = 1
        textFieldContainer.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
    }
    
    private func commitInit(){
    Bundle.main.loadNibNamed("cutomNavigationBar",owner: self, options: nil)
        addSubview(mainContainerView)
        mainContainerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
