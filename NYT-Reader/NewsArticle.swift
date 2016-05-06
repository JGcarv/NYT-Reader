//
//  NewsArticle.swift
//  NYT-Reader
//
//  Created by Joao Gabriel Carvalho on 03/05/16.
//  Copyright © 2016 Joao Gabriel Carvalho. All rights reserved.
//

import UIKit
import Foundation

class NewsArticle: NSObject {

    var section: String? = nil
    var subsection: String? = nil
    var title: String? = nil
    var abstract: String? = nil
    var url:String? = nil
    var byline:String? = nil
    var sectionColor: UIColor? = nil
    
    func setSectionColor(){
        switch self.section! {
        case "Arts":
            self.sectionColor = UIColor.palettePurple()
        case "Sports":
            self.sectionColor = UIColor.paletteOrange()
        case "U.S.":
            self.sectionColor = UIColor.paletteBlue()
        case "World":
            self.sectionColor = UIColor.paletteRed()
        case "Business Day":
            self.sectionColor = UIColor.paletteCyan()
        case "Real Estate":
            self.sectionColor = UIColor.paletteGrey()
        case "Books":
            self.sectionColor = UIColor.paletteGreen()
        case "Food":
            self.sectionColor = UIColor.paletteLightGreen()
        case "Travel":
            self.sectionColor = UIColor.paletteLightBrown()
        case "N.Y. / Region":
            self.sectionColor = UIColor.paletteSalmon()
        default:
            self.sectionColor = UIColor.grayColor()
        }
    }
    
}

