//
//  StagesOfLazy.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 24/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import Foundation

class StagesOfLazy: NSObject {
    
    
    internal static func pointsToString(points: Int16) -> String {
        var ret: String?
        
        switch (points) {
        case -666 ... -21:
            ret = "Lazy Bastard!"
            break;
            
        case -20 ... -11:
            ret = "Procrastination for ever!"
            break;
            
        case -10 ... -6:
            ret = "You should do something about that"
            break;
            
        case -5 ... -1:
            ret = "Right ..."
            break;
            
        case 0:
            ret = "Do something!"
            break;
            
        case 1 ... 5:
            ret = "Yeah BABY!"
            break;
            
        case 6 ... 10:
            ret = "Am on the roll!"
            break;
            
        case 11 ... 20:
            ret = "Mamma Mia!"
            break;
            
        case 21 ... 30:
            ret = "Holy Moly!!"
            break;
            
        case 21 ... 30:
            ret = "Procrastinator has died!"
            break;
            
        case 31 ... 9999:
            ret = "You don't need me Yo!!!!"
            break;
            
        default:
            ret = "No comment"
            break;
        }
        
        return ret!
    }
    

}
