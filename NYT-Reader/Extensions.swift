//
//  Extensions.swift
//  NYT-Reader
//
//  Created by Joao Gabriel Carvalho on 28/04/16.
//  Copyright © 2016 Joao Gabriel Carvalho. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func paletteOrange() -> UIColor{
        return UIColor.rgb(255, green: 78, blue: 4)
    }
    
    static func paletteBlue() -> UIColor{
        return UIColor.rgb(1, green: 71, blue: 204)
    }
    
    static func paletteRed() -> UIColor{
        return UIColor.rgb(204, green: 31, blue: 1)
    }
    
    static func paletteCyan() -> UIColor{
        return UIColor.rgb(227, green: 226, blue: 225)
    }
    
    static func palettePurple() -> UIColor{
        return UIColor.rgb(77, green: 103, blue: 153)
    }
    
    static func paletteLightGreen() -> UIColor{
        return UIColor.rgb(101, green: 255, blue: 173)
    }
    
    static func paletteGreen() -> UIColor{
        return UIColor.rgb(80, green: 204, blue: 103)
    }
    
    static func paletteLightBrown() -> UIColor{
        return UIColor.rgb(204, green: 142, blue: 73)
    }
    
    static func paletteSalmon() -> UIColor{
        return UIColor.rgb(255, green: 157, blue: 126)
    }
    
    static func paletteGrey() -> UIColor{
        return UIColor.rgb(153, green: 147, blue: 136)
    }
    
    
}

extension UIView {
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerate() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}