//
//  WalkThroughViewController.swift
//  Medec
//
//  Created by Yeabsira Gashaw on 12/7/19.
//  Copyright © 2019 Yabbb. All rights reserved.
//

import UIKit

class WalkThroughViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
