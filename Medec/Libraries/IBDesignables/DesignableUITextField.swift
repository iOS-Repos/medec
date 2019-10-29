//
//  DesignableUITextField.swift
//  Medec
//
//  Created by Yeabsira Gashaw on 10/30/19.
//  Copyright © 2019 Yabbb. All rights reserved.
//

import UIKit

@IBDesignable class DesignableUITextField: UITextField {
    
    var shadowLayer: CAShapeLayer!
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var leftImage : UIImage = UIImage() {
        didSet {
            let imageView = UIImageView(image: leftImage)
            self.leftView = imageView
            self.leftViewMode = .always
        }
    }
    
    
    @IBInspectable var rightImage : UIImage = UIImage() {
        didSet {
            let imageView = UIImageView(image: rightImage)
            self.rightView = imageView
            self.rightViewMode = .always
        }
    }
    
    @IBInspectable var leftPadding : CGFloat = 0

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        var txtRect = super.placeholderRect(forBounds: bounds)
        txtRect.origin.x += txtRect.origin.x + 5
        return txtRect
    }

    @IBInspectable var rightPadding : CGFloat = 0
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= rightPadding
        return textRect
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

    override func layoutSubviews() {
        super.layoutSubviews()
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius * 2).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor
            shadowLayer.shadowColor = UIColor.darkGray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            shadowLayer.shadowOpacity = 0.15
            shadowLayer.shadowRadius = layer.cornerRadius * 2
            layer.insertSublayer(shadowLayer, at: 0)
            //layer.insertSublayer(shadowLayer, below: nil) // also works
        }
    }
}
