//
//  OtpScreenViewController.swift
//  demoKBZ
//
//  Created by Vibhishan on 3/11/20.
//  Copyright © 2020 Devloper. All rights reserved.
//

import UIKit

class OtpScreenViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var otpBackImage: UIImageView!
    
    @IBOutlet weak var OtpContainer: UIView!
    
    @IBOutlet weak var verifyButtonOutlet: UIButton!
    

    @IBOutlet weak var firstOtpView: UITextField!
    
    @IBOutlet weak var secondOtptxtField: UITextField!
    
    @IBOutlet weak var fourthOtpField: UITextField!
    
    @IBOutlet weak var thirdOtpField: UITextField!
    
    @IBOutlet weak var fifthOtpField: UITextField!
    
    @IBOutlet weak var sixthOtpField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
        otpBackImage.isUserInteractionEnabled = true
        otpBackImage.addGestureRecognizer(tap)
        self.otpContainerDesign()
        self.addTargetMethod()
    }
    
    
    @IBAction func verifyButtonAction(_ sender: UIButton) {
        if self.firstOtpView.text! == "1" && self.secondOtptxtField.text! == "0" && self.thirdOtpField.text! == "2" && self.fourthOtpField.text! == "0" && self.fifthOtpField.text! == "3" && self.sixthOtpField.text! == "0" {
        self.emptyTextField()
            
        let navigateToHome: KbzBottomTabBarController = self.storyboard?.instantiateViewController(withIdentifier: "kbzTabBar") as! KbzBottomTabBarController
            self.navigationController?.pushViewController(navigateToHome, animated: true)
            
        }else{
            self.emptyTextField()
            self.customAlert()
        }
        
    }
    
    func otpContainerDesign(){
        self.OtpContainer.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.OtpContainer.layer.shadowOpacity = 1
        self.OtpContainer.layer.shadowOffset = .zero
        self.OtpContainer.layer.shadowRadius = 10
        self.OtpContainer.layer.cornerRadius = 5
        self.verifyButtonOutlet.layer.cornerRadius = 5
            self.verifyButtonOutlet.layer.borderWidth = 1
            self.verifyButtonOutlet.layer.borderColor = #colorLiteral(red: 0.02352941176, green: 0.368627451, blue: 0.7058823529, alpha: 1)
        self.firstOtpView.layer.borderWidth = 1
        self.firstOtpView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.firstOtpView.layer.cornerRadius = 5
        
        self.secondOtptxtField.layer.borderWidth = 1
        self.secondOtptxtField.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.secondOtptxtField.layer.cornerRadius = 5
        
        self.thirdOtpField.layer.borderWidth = 1
        self.thirdOtpField.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.thirdOtpField.layer.cornerRadius = 5
        
        self.fourthOtpField.layer.borderWidth = 1
        self.fourthOtpField.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.fourthOtpField.layer.cornerRadius = 5
        
        self.fifthOtpField.layer.borderWidth = 1
        self.fifthOtpField.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.fifthOtpField.layer.cornerRadius = 5
        
        self.sixthOtpField.layer.borderWidth = 1
        self.sixthOtpField.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.sixthOtpField.layer.cornerRadius = 5
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maxLength : Int!
        maxLength = 6
        let currentString: NSString = textField.text! as NSString
        
        let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
        
        firstOtpView.text = ""
        
       secondOtptxtField.text = ""
        thirdOtpField.text = ""
      fourthOtpField.text = ""
       fifthOtpField.text = ""
        sixthOtpField.text = ""
        
        let string = newString as String
        
        for (index,char) in string.enumerated(){
            
            switch index{
                
                case 0:
                 firstOtpView.text = "\(char)"
                case 1:
                 secondOtptxtField.text = "\(char)"
                case 2:
                 thirdOtpField.text = "\(char)"
                case 3:
                 fourthOtpField.text = "\(char)"
                case 4:
                 fifthOtpField.text = "\(char)"
                case 5:
                 sixthOtpField.text = "\(char)"
                
                
            default:
                break
            }
            
            
        }
        
        
        return newString.length <= maxLength
    }
    
    @objc func tapFunction(sender: UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func textdidChange(textField: UITextField){
        let text = textField.text
        if text?.utf16.count == 1{
            switch textField {
            case firstOtpView:
                secondOtptxtField.becomeFirstResponder()
                break
            case secondOtptxtField:
                thirdOtpField.becomeFirstResponder()
                break
            case thirdOtpField:
                fourthOtpField.becomeFirstResponder()
                break
            case fourthOtpField:
                fifthOtpField.becomeFirstResponder()
                break
            case fifthOtpField:
                sixthOtpField.becomeFirstResponder()
                break
            case sixthOtpField:
                sixthOtpField.becomeFirstResponder()
                break
            default:
                break
                
            }
            
        }else{
            switch textField {
            case firstOtpView:
                self.firstOtpView.resignFirstResponder()
                break
            case secondOtptxtField:
                self.firstOtpView.becomeFirstResponder()
                break
            case thirdOtpField:
                self.secondOtptxtField.becomeFirstResponder()
                break
            case fourthOtpField:
                self.thirdOtpField.becomeFirstResponder()
                break
            case fifthOtpField:
                self.fourthOtpField.becomeFirstResponder()
                break
            case sixthOtpField:
                self.fifthOtpField.becomeFirstResponder()
                break
            default:
                break
               
            }
        }
    }
    
        func addTargetMethod(){
            self.firstOtpView.addTarget(self, action: #selector(self.textdidChange(textField:)), for: UIControl.Event.editingChanged
            )
            self.secondOtptxtField.addTarget(self, action: #selector(self.textdidChange(textField:)), for: UIControl.Event.editingChanged
            )
            self.thirdOtpField.addTarget(self, action: #selector(self.textdidChange(textField:)), for: UIControl.Event.editingChanged
            )
            self.fourthOtpField.addTarget(self, action: #selector(self.textdidChange(textField:)), for: UIControl.Event.editingChanged
            )
            self.fifthOtpField.addTarget(self, action: #selector(self.textdidChange(textField:)), for: UIControl.Event.editingChanged
            )
            self.sixthOtpField.addTarget(self, action: #selector(self.textdidChange(textField:)), for: UIControl.Event.editingChanged
            )
        }
    
    func emptyTextField(){
        self.firstOtpView.text = nil
        self.secondOtptxtField.text = nil
        self.thirdOtpField.text = nil
        self.fourthOtpField.text = nil
        self.fifthOtpField.text = nil
        self.sixthOtpField.text = nil
    }
    
    @objc func customAlert(){
        let alerData = UIAlertController(title: "Incorrect Otp", message: "Enter Correct Otp", preferredStyle: .alert)
        present(alerData, animated: true, completion: nil)
        let cancelButton = UIAlertAction(title: "Ok", style: .cancel) { (action) in
            
        }
        alerData.addAction(cancelButton)
    }
}
