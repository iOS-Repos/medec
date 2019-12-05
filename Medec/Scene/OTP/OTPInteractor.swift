//
//  OTPInteractor.swift
//  Medec
//
//  Created by Yeabsira Gashaw on 12/5/19.
//  Copyright © 2019 Yabbb. All rights reserved.
//

protocol OTPInteractorInterface
{
    //    func login(request: Login.FetchUser.Request)
}

class OTPInteractor: OTPInteractorInterface
{
    var output: OTPPresenterInterface!
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
