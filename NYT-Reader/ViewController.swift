//
//  ViewController.swift
//  NYT-Reader
//
//  Created by Joao Gabriel Carvalho on 28/04/16.
//  Copyright © 2016 Joao Gabriel Carvalho. All rights reserved.
//

import UIKit

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellID = "newsCell"
    var newsList: [NewsArticle] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "New York Times Reader"
        //print(newsList)
        
        collectionView?.registerClass(CellNews.self, forCellWithReuseIdentifier: cellID)
        collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.showsVerticalScrollIndicator = false
        
        JSONHelper.fetchArticles { (newsList) in
            self.newsList = newsList
            self.collectionView?.reloadData()
            
        }
        
        
    }

    
    override func collectionView(collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int{
        return newsList.count
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! CellNews
        
        cell.news = newsList[indexPath.item]
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.width - 10 , 100)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return CGFloat(8)
    }
    

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    
}

