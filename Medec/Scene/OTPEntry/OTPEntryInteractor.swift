//
//  OTPEntryInteractor.swift
//  Medec
//
//  Created by Yeabsira Gashaw on 12/5/19.
//  Copyright © 2019 Yabbb. All rights reserved.
//

protocol OTPEntryInteractorInterface
{
    //    func login(request: Login.FetchUser.Request)
}

class OTPEntryInteractor: OTPEntryInteractorInterface
{
    var output: OTPEntryPresenterInterface!
//    var worker: LoginWorker!
    
    // MARK: - Business logic
    
    //    func login(request: Login.FetchUser.Request) {
    //
    //        worker = LoginWorker()
    //        worker.login(request: request) { [weak self] response  in
    //            guard let s = self else { return }
    //            s.output.presentFetchedUser(response: response)
    //        }
    //
    //    }
}
