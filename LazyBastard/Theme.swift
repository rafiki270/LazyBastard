//
//  Theme.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 12/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


struct Gradient {
    
    var firstColor: UIColor?
    var lastColor: UIColor?
    
}


class Theme : NSObject {
    
    
    // MARK: Fonts
    
    static func appFontWithSize(size: CGFloat) -> UIFont {
        return UIFont.init(name: "HelveticaNeue-UltraLight", size: size)!
    }
    
    static func appBoldFontWithSize(size: CGFloat) -> UIFont {
        return UIFont.init(name: "HelveticaNeue-Medium", size: size)!
    }
    
    // MARK: Colors
    
    static func statsGradientColors() -> [CGColorRef] {
        let col1: CGColorRef = UIColor.realRGB(238, green: 185, blue: 0).CGColor as CGColorRef
        let col2: CGColorRef = UIColor.realRGB(231, green: 159, blue: 0).CGColor as CGColorRef
        return [col1, col2]
    }
    
    static func statsTextColor() -> UIColor {
        return UIColor.whiteColor()
    }
    
    static func votingBackgroundColor() -> UIColor {
        return UIColor.init(white: 0.95, alpha: 1)
    }
    
    static func votingDownVoteColor() -> UIColor {
        return UIColor.realRGB(198, green: 68, blue: 63)
    }
    
    static func votingUpVoteColor() -> UIColor {
        return UIColor.realRGB(0, green: 179, blue: 132)
    }
    
    static func tasksBackgroundColor() -> UIColor {
        return UIColor.realRGB(198, green: 68, blue: 63)
    }

    static func tasksTextColor() -> UIColor {
        return UIColor.whiteColor()
    }
    
    static func addTaskBackgroundColor() -> UIColor {
        return self.votingUpVoteColor()
    }
    
    static func addTaskTextColor() -> UIColor {
        return UIColor.whiteColor()
    }
    
    static func statusBarColor() -> UIColor {
        //return UIColor(CGColor: Theme.statsGradientColors().last!)
        return UIColor.clearColor()
    }
    
    // MARK: Helper methods
    
    static func setStatusBarBackgroundColor(color: UIColor) {
        guard  let statusBar = UIApplication.sharedApplication().valueForKey("statusBarWindow")?.valueForKey("statusBar") as? UIView else {
            return
        }
        statusBar.backgroundColor = color
    }
    
    
}