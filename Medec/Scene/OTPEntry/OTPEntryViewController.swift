//
//  OTPEntryViewController.swift
//  Medec
//
//  Created by Yeabsira Gashaw on 10/30/19.
//  Copyright © 2019 Yabbb. All rights reserved.
//

import UIKit
import FlagPhoneNumber
import Firebase
protocol OTPEntryViewControllerInterface
{
    
    //    func displayFetchedUser(viewModel: Login.FetchUser.ViewModel) // Passes the model to which the response should be casted to / modeled
    
    func setupUI() // Sets Animation , Border ... all UI related things
    func doLocalization()
    func flipSubmitButtonToEnabled()
    func flipSubmitButtonToDisabled()
}

class OTPEntryViewController : UIViewController , OTPEntryViewControllerInterface {
    
    @IBOutlet weak var countryPickerContainerView: UIView!
    @IBOutlet weak var phoneNumberMainTextField: DesignableUITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    var output: OTPEntryInteractorInterface!
    var router: OTPEntryRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Binds Router + Interactor + Presenter - Maybe Worker Too
        OTPEntryConfigurator.sharedInstance.configure(viewController: self)
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    private func getCustomTextFieldInputAccessoryView(with items: [UIBarButtonItem]) -> UIToolbar {
        let toolbar: UIToolbar = UIToolbar()
        
        toolbar.barStyle = UIBarStyle.default
        toolbar.items = items
        toolbar.sizeToFit()
        
        return toolbar
    }
    
    public func setupUI(){
        
        phoneNumberMainTextField.rightImage = UIImage()
        phoneNumberMainTextField.delegate = self
        phoneNumberMainTextField.addTarget(self, action: #selector(textFieldDidChange(_:)),
                                           for: UIControl.Event.editingChanged)
        
        flipSubmitButtonToDisabled()
        
        hideKeyboardWhenTappedAround()
    }
    
    public func doLocalization() {
        
    }
    
    @objc func textFieldDidChange(_ textField: DesignableUITextField) {
        if let text = textField.text {
            
            if text.count >= 10 {
                textField.rightImage = UIImage(named: "checkmarked-icon")!
                flipSubmitButtonToEnabled()
            }else {
                textField.rightImage = UIImage()
                flipSubmitButtonToDisabled()
            }
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        PhoneAuthProvider.provider().verifyPhoneNumber("+251923930947", uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                print("errrr " , error)
                return
            }
            // Sign in using the verificationID and the code sent to the user
            // ...
            print("--- verification id : ", verificationID)
            print("--- verification error : " , error)
            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
        }
        //        if let navController = self.navigationController {
        //            navController.popViewController(animated: true)
        //        }
    }
    
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        
    }
    
    func flipSubmitButtonToEnabled() {
        
        submitButton.isEnabled = true
        submitButton.alpha = 1.0
    }
    
    func flipSubmitButtonToDisabled() {
        
        submitButton.isEnabled = false
        submitButton.alpha = 0.5
    }
}


extension OTPEntryViewController: FPNTextFieldDelegate {
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        textField.rightViewMode = .always
        //        textField.rightView = UIImageView(image: isValid ? #imageLiteral(resourceName: "success") : #imageLiteral(resourceName: "error"))
        
        print(
            isValid,
            textField.getFormattedPhoneNumber(format: .E164) ?? "E164: nil",
            textField.getFormattedPhoneNumber(format: .International) ?? "International: nil",
            textField.getFormattedPhoneNumber(format: .National) ?? "National: nil",
            textField.getFormattedPhoneNumber(format: .RFC3966) ?? "RFC3966: nil",
            textField.getRawPhoneNumber() ?? "Raw: nil"
        )
    }

    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code)
    }
}


extension OTPEntryViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if (isBackSpace == -92) {
                
                return true
            }
        }
        
        if textField.text?.count == 12 {
            return false
        }
    
        return true
    }
}
