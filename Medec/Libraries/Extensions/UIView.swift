//
//  UIView.swift
//  Medec
//
//  Created by Yeabsira Gashaw on 12/8/19.
//  Copyright © 2019 Yabbb. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(_ corners:UIRectCorner,_ cormerMask:CACornerMask, radius: CGFloat) {
        if #available(iOS 11.0, *){
            self.clipsToBounds = false
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = cormerMask
        }else{
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            rectShape.path = UIBezierPath(roundedRect: self.bounds,    byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
            self.layer.mask = rectShape
        }
    }

}

