//
//  UIColor+Helpers.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 12/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


extension UIColor {
    
    
    internal static func realRGB(red: Float, green: Float, blue: Float, alpha: Float) -> UIColor {
        return UIColor.init(colorLiteralRed: (red / 255.0), green: (green / 255), blue: (blue / 255), alpha: alpha)
    }
    
    internal static func realRGB(red: Float, green: Float, blue: Float) -> UIColor {
        return self.realRGB(red, green: green, blue: blue, alpha: 1.0)
    }
    
    
}