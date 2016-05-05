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
    //{
//        didSet{
//            if (self.section == "Arts"){
//                self.sectionColor = UIColor.palettePurple()
//                print("setted coor")
//            }
//        }
    
    var subsection: String? = nil
    var title: String? = nil
    var abstract: String? = nil
    var url:String? = nil
    var sectionColor: UIColor? = nil
    
    func setSectionColor(){
        switch self.section! {
        case "Arts":
            self.sectionColor = UIColor.palettePurple()
        default:
            self.sectionColor = UIColor.grayColor()
        }
    }
    
}
