//
//  ViewController.swift
//  demoKBZ
//
//  Created by Vibhishan on 3/4/20.
//  Copyright © 2020 Devloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var cancelImage: UIImageView!
    
    @IBOutlet weak var kmzTextImage: UIImageView!
  
    
    @IBOutlet weak var loginContainerView: UIView!
    
    @IBOutlet weak var sendOtpOutlet: UIButton!
    
    @IBOutlet weak var enterMobileTextFieldContainer: UIView!
    @IBOutlet weak var enterMobileTextField: UITextField!
    
    @IBOutlet weak var byLogInText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logInDesign()
        self.logInViewContainer()
        self.sendOtpDesign()
        self.textFieldDesign()
        self.enterMobileTextField.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
        cancelImage.isUserInteractionEnabled = true
        cancelImage.addGestureRecognizer(tap)
      
    }

    func logInDesign(){
        self.cancelImage.image = #imageLiteral(resourceName: "cancel")
        self.kmzTextImage.image = #imageLiteral(resourceName: "KBX e-store")
    }
    
    func logInViewContainer(){
         self.loginContainerView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
         self.loginContainerView.layer.shadowOpacity = 1
         self.loginContainerView.layer.shadowOffset = .zero
         self.loginContainerView.layer.shadowRadius = 10
         self.loginContainerView.layer.cornerRadius = 5
    }
    
    func textFieldDesign(){
        self.enterMobileTextFieldContainer.layer.cornerRadius = 5
        self.enterMobileTextFieldContainer.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.enterMobileTextFieldContainer.layer.borderWidth = 1
        self.enterMobileTextField.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
    
    @IBAction func sendOtpAction(_ sender: UIButton) {
        if self.enterMobileTextField.text!.isValidContact {
        let navigateToHome: OtpScreenViewController = self.storyboard?.instantiateViewController(withIdentifier: "OtpScreen") as! OtpScreenViewController
        self.navigationController?.pushViewController(navigateToHome, animated: true)
        self.emptyTextField()
        }else{
            
                self.emptyTextField()
                let alerData = UIAlertController(title: "Warning", message: "Enter Valid Mobile No", preferredStyle: .alert)
                present(alerData, animated: true, completion: nil)
                let cancelButton = UIAlertAction(title: "Ok", style: .cancel) { (action) in
                    
                }
                alerData.addAction(cancelButton)
           
        }
       ReasuableFunctions.sharedInstance.check()
    }
    
    func sendOtpDesign(){
        self.sendOtpOutlet.layer.cornerRadius = 5
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maxLength : Int!
        maxLength = 10
        let currentString: NSString = textField.text! as NSString
        
        let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    @objc func tapFunction(sender: UITapGestureRecognizer) {
        self.customAlert()
    }
    
    @objc func customAlert(){
        let alerData = UIAlertController(title: "Cancel", message: "Pressed Cancel", preferredStyle: .alert)
        present(alerData, animated: true, completion: nil)
        let cancelButton = UIAlertAction(title: "Ok", style: .cancel) { (action) in

        }
        alerData.addAction(cancelButton)
    }
    
    func emptyTextField(){
        self.enterMobileTextField.text = nil
    }
}

extension String {
    var isValidContact: Bool {
        let phoneNumberRegex = "^[6-9]\\d{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let isValidPhone = phoneTest.evaluate(with: self)
        return isValidPhone
    }
    
    
}

