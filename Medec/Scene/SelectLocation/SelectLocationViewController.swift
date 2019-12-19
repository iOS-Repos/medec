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
    @IBOutlet weak var locationsTableView: UITableView!
    @IBOutlet weak var currentLocation: UILabel!
    
    
    var prefferdUserLocation : String = ""
    var currentCountryFlagIndex : IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        hideKeyboardWhenTappedAround()
        locationsTableView.dataSource = self
        locationsTableView.delegate = self
        
        prefferdUserLocation = UserDefaults.standard.string(forKey: Constants.Account.prefferedLocation) ?? "Ethiopia"
        currentLocation.text = prefferdUserLocation
        
        
    }
    
    func setupUI() {
        navigationController?.navigationBar.isHidden = true
        locationsTableView.separatorStyle = .none
    }
    
    
    func doLocalization() {
        
        
    }
    
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        
    }
    
    
    
    
    
}

extension SelectLocationViewController : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DataSources.countriesNameData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.selectLocationTableViewCell, for: indexPath) as! SelectionLocationTableViewCell
        
        let country = DataSources.countriesNameData[indexPath.row]["name"]
        cell.locationName.text = country
        
        if prefferdUserLocation == country {
            
            cell.locationFlag.isHidden = false
            currentCountryFlagIndex = indexPath
            cell.locationName.font = UIFont(name:"Poppins-SemiBold", size: 15.0)
        }else {
            cell.locationFlag.isHidden = true
            cell.locationName.font = UIFont(name:"Poppins-Regular", size: 14.0)
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let country = DataSources.countriesNameData[indexPath.row]["name"]
        UserDefaults.standard.set(country, forKey: Constants.Account.prefferedLocation)
        UserDefaults.standard.synchronize() // To Reload UseDefaults
        
        
        if let index = currentCountryFlagIndex {
            let previousCell = tableView.cellForRow(at: index) as? SelectionLocationTableViewCell
            previousCell?.locationFlag.isHidden = true
            previousCell?.locationName.font = UIFont(name:"Poppins-Regular", size: 14.0)
            let currentCell = tableView.cellForRow(at: indexPath) as! SelectionLocationTableViewCell
            currentCell.locationName.font = UIFont(name:"Poppins-SemiBold", size: 15.0)
            currentCell.locationFlag.isHidden = false
            currentCountryFlagIndex = indexPath
            currentLocation.text = country
        }
        
    }
    
}
