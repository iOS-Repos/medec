//
//  SelectLocationViewController.swift
//  Medec
//
//  Created by Yeabsira Gashaw on 12/8/19.
//  Copyright © 2019 Yabbb. All rights reserved.
//

import UIKit

protocol SelectLocationViewControllerInterface
{
    
    func setupUI() // Sets Animation , Border ... all UI related things
    func doLocalization()
}

class SelectLocationViewController: UIViewController, SelectLocationViewControllerInterface {
    
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        hideKeyboardWhenTappedAround()
    }
    
    func setupUI() {
        navigationController?.navigationBar.isHidden = true
    }
    
    
    func doLocalization() {
        
        
    }
    
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        
    }
    
    
    
    
    
}
