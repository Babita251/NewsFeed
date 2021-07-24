//
//  Constant.swift
//  NewsFeedApp
//
//  Created by babita pal on 24/07/21.
//

import Foundation
import UIKit

let COMMON_BACKGROUND_COLOR               =      colorFromRGB(red: 235, green: 235, blue: 241)
let COMMON_SUBTITLE_COLOR                 =        colorFromRGB(red: 80, green: 80, blue: 80)
let COMMON_GREEN_COLOR                 =        colorFromRGB(red: 97, green: 129, blue: 104)


let fontSize10                          =        UIFont(name:"Helvetica-Light", size:10.0)!
let semiBoldFontSize14            =        UIFont(name: "Helvetica", size: 14.0)!
let boldFontSize14                     =        UIFont(name:"Helvetica-Bold", size:14.0)!


func colorFromRGB(red:CGFloat, green:CGFloat, blue:CGFloat) -> UIColor {
    let color: UIColor = UIColor( red: CGFloat(red/255.0), green: CGFloat(green/255.0), blue: CGFloat(blue/255.0), alpha: CGFloat(1.0) )
    return color
}
