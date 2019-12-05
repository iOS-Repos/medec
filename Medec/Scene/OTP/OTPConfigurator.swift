//
//  OTPConfigurator.swift
//  Medec
//
//  Created by Yeabsira Gashaw on 12/5/19.
//  Copyright © 2019 Yabbb. All rights reserved.
//

// MARK: - Connect View, Interactor, and Presenter

class OTPConfigurator
{
    // MARK: - Object lifecycle
    
    static let sharedInstance = OTPConfigurator()
    
    private init() {}
    
    // MARK: - Configuration
    
    func configure(viewController: OTPViewController)
    {
        let router = OTPRouter()
        router.viewController = viewController
        
        let presenter = OTPPresenter()
        presenter.output = viewController
        
        let interactor = OTPInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
