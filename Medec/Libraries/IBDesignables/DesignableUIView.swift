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



/* Custom Corner Radius
 * Source : https://vispud.blogspot.com/2019/04/how-to-set-cornerradius-for-only-bottom.html
 */
@IBDesignable
class RoundedCornerView: UIView {
    
    var cornerRadiusValue : CGFloat = 0
    var corners : UIRectCorner = []
    
    @IBInspectable public var cornerRadius : CGFloat {
        get {
            return cornerRadiusValue
        }
        set {
            cornerRadiusValue = newValue
        }
    }
    
    @IBInspectable public var topLeft : Bool {
        get {
            return corners.contains(.topLeft)
        }
        set {
            if newValue {
                corners.insert(.topLeft)
                updateCorners()
            } else {
                if corners.contains(.topLeft) {
                    corners.remove(.topLeft)
                    updateCorners()
                }
            }
        }
    }
    
    @IBInspectable public var topRight : Bool {
        get {
            return corners.contains(.topRight)
        }
        set {
            if newValue {
                corners.insert(.topRight)
                updateCorners()
            } else {
                if corners.contains(.topRight) {
                    corners.remove(.topRight)
                    updateCorners()
                }
            }
            
        }
    }
    
    @IBInspectable public var bottomLeft : Bool {
        get {
            return corners.contains(.bottomLeft)
        }
        set {
            if newValue {
                corners.insert(.bottomLeft)
                updateCorners()
            } else {
                if corners.contains(.bottomLeft) {
                    corners.remove(.bottomLeft)
                    updateCorners()
                }
            }
            
        }
    }
    
    @IBInspectable public var bottomRight : Bool {
        get {
            return corners.contains(.bottomRight)
        }
        set {
            if newValue {
                corners.insert(.bottomRight)
                updateCorners()
            } else {
                if corners.contains(.bottomRight) {
                    corners.remove(.bottomRight)
                    updateCorners()
                }
            }
            
        }
    }
    
    func updateCorners() {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadiusValue, height: cornerRadiusValue))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}
