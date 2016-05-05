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
        }
    }
    
    
    
    let section: UIView = {
       let section = UIView()
       section.translatesAutoresizingMaskIntoConstraints = false
       return section
    }()
    
    let title: UILabel = {
    
        
        let title = UILabel()
        title.backgroundColor = UIColor.whiteColor()
        title.numberOfLines = 3
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    
    func setUpCell(){
        addSubview(section)
        addSubview(title)
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[v0(10)]-6-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": section, "v1": title]))
        
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": section]))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": title]))
        
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