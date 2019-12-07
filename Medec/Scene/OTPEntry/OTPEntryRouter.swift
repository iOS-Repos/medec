//
//  OTPEntryRouter.swift
//  Medec
//
//  Created by Yeabsira Gashaw on 12/5/19.
//  Copyright © 2019 Yabbb. All rights reserved.
//

protocol OTPEntryRouterInterface
{
    func navigateToTab()
}

class OTPEntryRouter: OTPEntryRouterInterface
{
    weak var viewController: OTPEntryViewController!
    
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
