//
//  Storyboard.swift
//  Medec
//
//  Created by Yeabsira Gashaw on 10/29/19.
//  Copyright © 2019 Yabbb. All rights reserved.
//

import UIKit

class Storyboard {
    private class func storyboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    class func viewController(by storyboardId:String) -> UIViewController{
        return storyboard().instantiateViewController(withIdentifier: storyboardId)
    }
}
