//
//  CellNews.swift
//  NYT-Reader
//
//  Created by Joao Gabriel Carvalho on 28/04/16.
//  Copyright © 2016 Joao Gabriel Carvalho. All rights reserved.
//

import Foundation
import UIKit

class CellNews: UICollectionViewCell {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
     setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var news: NewsArticle? {
        didSet{
            if let color = news!.sectionColor{
                self.section.backgroundColor = color
            }
            if let title = news!.title{
                self.title.text = title
                
            }
            if let abstract =  news!.abstract{
                self.abstract.text = abstract
                
            }
            if let byline =  news!.byline{
                self.byline.text = byline
                
            }
        }
    }
    
    
    
    let section: UIView = {
       let section = UIView()
       section.translatesAutoresizingMaskIntoConstraints = false
       return section
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.numberOfLines = 2
        title.adjustsFontSizeToFitWidth = false
        title.lineBreakMode = .ByWordWrapping
        title.font = UIFont(name: "Times New Roman", size: 16)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let abstract: UILabel = {
        
        let abstract = UILabel()
        abstract.textColor = UIColor(white: 0, alpha: 0.65)
        abstract.font = UIFont.systemFontOfSize(12)
        abstract.numberOfLines = 3
        abstract.adjustsFontSizeToFitWidth = true
        abstract.translatesAutoresizingMaskIntoConstraints = false
        
        return abstract
    }()
    
    let byline: UILabel = {
        let byline = UILabel()
        byline.font = UIFont.systemFontOfSize(10)
        byline.textColor = UIColor(white: 0, alpha: 0.4)
        byline.translatesAutoresizingMaskIntoConstraints = false
        return byline
    }()
    
    
    
    func setUpCell(){
        addSubview(section)
        addSubview(title)
        addSubview(abstract)
        addSubview(byline)
        
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[v0(10)]-6-[v1]-3-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": section, "v1": title]))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[v0(10)]-6-[v1]-3-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": section, "v1": abstract]))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[v0(10)]-6-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": section, "v1": byline]))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-8-[v0]-4-[v1(38)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": title, "v1": abstract]))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[v0]-2-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": byline]))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": section]))
        
        
        

        
        
        self.backgroundColor = UIColor.whiteColor()
        
        
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.4
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOffset = CGSizeMake(0, 1)
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).CGPath
        
        self.clipsToBounds = false;
        self.layer.masksToBounds = false;
        
        
    }
}