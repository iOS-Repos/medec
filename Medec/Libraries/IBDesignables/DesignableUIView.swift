//
//  DesignableUIView.swift
//  Medec
//
//  Created by Yeabsira Gashaw on 10/30/19.
//  Copyright © 2019 Yabbb. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableUIView : UIView{
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    @IBInspectable var cornerRadius : CGFloat = 5 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor : UIColor = UIColor.black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var shadowColor : UIColor = UIColor.black {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOffset : CGSize = CGSize.zero {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var shadowRadius : CGFloat = 2 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity : Float = 0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    
}
