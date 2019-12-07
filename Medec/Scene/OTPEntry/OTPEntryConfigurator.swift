//
//  OTPEntryEntryConfigurator.swift
//  Medec
//
//  Created by Yeabsira Gashaw on 12/7/19.
//  Copyright © 2019 Yabbb. All rights reserved.
//

// MARK: - Connect View, Interactor, and Presenter

class OTPEntryConfigurator
{
    // MARK: - Object lifecycle
    
    static let sharedInstance = OTPEntryConfigurator()
    
    private init() {}
    
    // MARK: - Configuration
    
    func configure(viewController: OTPEntryViewController)
    {
        let router = OTPEntryRouter()
        router.viewController = viewController
        
        let presenter = OTPEntryPresenter()
        presenter.output = viewController
        
        let interactor = OTPEntryInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}

