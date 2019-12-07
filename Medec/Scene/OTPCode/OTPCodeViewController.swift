//
//  OTPCodeViewController.swift
//  Medec
//
//  Created by Yeabsira Gashaw on 12/7/19.
//  Copyright © 2019 Yabbb. All rights reserved.
//

import UIKit
import SVPinView

protocol OTPCodeViewControllerInterface
{
    
    //    func displayFetchedUser(viewModel: Login.FetchUser.ViewModel) // Passes the model to which the response should be casted to / modeled
    
    func setupUI() // Sets Animation , Border ... all UI related things
    func doLocalization()
}

class OTPCodeViewController: UIViewController, OTPCodeViewControllerInterface {
    
    @IBOutlet weak var otpPinView: SVPinView!
    @IBOutlet weak var otpSubmitCode: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        
        otpSubmitCode.isEnabled = false
        otpSubmitCode.alpha = 0.5
        configurePinView(pinView: otpPinView)
        otpPinView.activeBorderLineThickness = 0.6
        hideKeyboardWhenTappedAround()
    }
    
    func doLocalization() {
        
    }
    
    func configurePinView(pinView : SVPinView) {
        
        pinView.pinLength = 5
        pinView.secureCharacter = "\u{25CF}"
        pinView.interSpace = 5
        pinView.textColor = UIColor.black
        pinView.borderLineColor = UIColor.gray
        pinView.activeBorderLineColor = UIColor.black
        pinView.borderLineThickness = 0.5
        pinView.shouldSecureText = true
        pinView.allowsWhitespaces = false
        pinView.style = .underline
        pinView.fieldBackgroundColor = UIColor.white.withAlphaComponent(0.3)
        pinView.activeFieldBackgroundColor = UIColor.white.withAlphaComponent(0.5)
//        pinView.placeholder = "******"
        pinView.becomeFirstResponderAtIndex = 0
        
        pinView.font = UIFont.systemFont(ofSize: 15)
        pinView.keyboardType = .phonePad
        pinView.pinInputAccessoryView = { () -> UIView in
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
            doneToolbar.barStyle = UIBarStyle.default
            let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(dismissKeyboard))

            var items = [UIBarButtonItem]()
            items.append(flexSpace)
            items.append(done)

            doneToolbar.items = items
            doneToolbar.sizeToFit()
            return doneToolbar
        }()
        
        pinView.didFinishCallback = didFinishEnteringPin(pin:)
        pinView.didChangeCallback = { pin in
            
        }
    }
    
    func didFinishEnteringPin(pin:String) {
        otpSubmitCode.isEnabled = true
        otpSubmitCode.alpha = 1.0
        print("code - " , pin )
    }

}
