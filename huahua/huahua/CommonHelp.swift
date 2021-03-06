//
//  CommonHelp.swift
//  huahua
//
//  Created by 黄伟昌 on 16/2/17.
//  Copyright © 2016年 黄伟昌. All rights reserved.
//

import Foundation
import UIKit

/**
 将16进制的颜色转成UIColor
 
 - parameter hex: 16进制颜色
 
 - returns: return UIColor 返回UIColor
 */
func colorWithHexString (hex:String) -> UIColor {
    var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
    
    if (cString.hasPrefix("#")) {
        cString = (cString as NSString).substringFromIndex(1)
    }
    
    if (cString.characters.count != 6) {
        return UIColor.grayColor()
    }
    

    
    let rString = (cString as NSString).substringToIndex(2)
    let gString = (cString as NSString).substringWithRange(NSMakeRange(2, 2))
    let bString = (cString as NSString).substringWithRange(NSMakeRange(4, 2))
    
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    NSScanner(string: rString).scanHexInt(&r)
    NSScanner(string: gString).scanHexInt(&g)
    NSScanner(string: bString).scanHexInt(&b)
    
    return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
}



