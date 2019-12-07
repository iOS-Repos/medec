//
//  OTPEntryPresenter.swift
//  Medec
//
//  Created by Yeabsira Gashaw on 12/5/19.
//  Copyright © 2019 Yabbb. All rights reserved.
//

protocol OTPEntryPresenterInterface
{
    //func presentFetchedUser(response: Login.FetchUser.Response)
}

class OTPEntryPresenter: OTPEntryPresenterInterface
{
    var output: OTPEntryViewControllerInterface!
    
    // MARK: - Presentation logic
    
    //    func presentFetchedUser(response: Login.FetchUser.Response)
    //    {
    //
    //        let viewModel = Login.FetchUser.ViewModel(
    //            user: response.user, isSuccess: response.isSuccess, errorMessage: response.errorMessage
    //        )
    //
    //        output.displayFetchedUser(viewModel: viewModel)
    //    }
}
