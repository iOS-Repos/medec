//
//  OTPViewController.swift
//  Medec
//
//  Created by Yeabsira Gashaw on 10/30/19.
//  Copyright © 2019 Yabbb. All rights reserved.
//

import UIKit
import FlagPhoneNumber
import Firebase
import GoogleSignIn

protocol OTPViewControllerInterface
{
    
    //    func displayFetchedUser(viewModel: Login.FetchUser.ViewModel) // Passes the model to which the response should be casted to / modeled
    
    func setupUI() // Sets Animation , Border ... all UI related things
    func doLocalization()
}

class OTPViewController : UIViewController , OTPViewControllerInterface, GIDSignInDelegate {
    
    
    
    
    @IBOutlet weak var phoneNumberTextField: FPNTextField!
    @IBOutlet weak var countryPickerContainerView: UIView!
    @IBOutlet weak var phoneNumberMainTextField: DesignableUITextField!
    
    var output: OTPInteractorInterface!
    var router: OTPRouter!
    
    @IBOutlet weak var googleSignin: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Binds Router + Interactor + Presenter - Maybe Worker Too
        OTPConfigurator.sharedInstance.configure(viewController: self)
        
        setupUI()
        
        GIDSignIn.sharedInstance().presentingViewController = self
        googleSignin.colorScheme = .dark
        googleSignin.style = .standard
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
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
        
        hideKeyboardWhenTappedAround()
    }
    
    public func doLocalization() {
        
    }
    
    
    @IBAction func mobileNumberButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "segueFromLoginOptionsToOTP", sender: nil)
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        let activityView = UIActivityIndicatorView(style: .large )
        activityView.center = CGPoint(x: self.view.bounds.size.width/2, y: (self.view.bounds.size.height/2) + 25)
        activityView.startAnimating()

        self.view.addSubview(activityView)
        
        if let _ = user {
            if let authentication = user.authentication {
                let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
                
                Auth.auth().signIn(with: credential, completion: { (user, error) -> Void in
                    if error != nil {
                        print("Problem at signing in with google with error : \(error)")
                    } else if error == nil {
                        self.view.willRemoveSubview(activityView)
                        self.performSegue(withIdentifier: "segueToHomeFromSignin", sender: nil)
                    }
                })
            }
        }
        
        self.view.willRemoveSubview(activityView)
    }
    
}
extension OTPViewController: FPNTextFieldDelegate {
    
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
