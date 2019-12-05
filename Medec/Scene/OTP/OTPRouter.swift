//
//  OTPRouter.swift
//  Medec
//
//  Created by Yeabsira Gashaw on 12/5/19.
//  Copyright © 2019 Yabbb. All rights reserved.
//

protocol OTPRouterInterface
{
    func navigateToTab()
}

class OTPRouter: OTPRouterInterface
{
    weak var viewController: OTPViewController!
    
    // MARK: - Navigation
    
    func navigateToTab()
    {
        let tab = Storyboard.viewController(by: "blueprinter")
        viewController.show(tab, sender: nil)
    }
    
    func segueToSignup(){
        
//        viewController.performSegue(withIdentifier: SegueIdentifier.loginToSignup , sender: nil)
        
    }
    
}
