//
//  JSONHelper.swift
//  NYT-Reader
//
//  Created by Joao Gabriel Carvalho on 03/05/16.
//  Copyright © 2016 Joao Gabriel Carvalho. All rights reserved.
//

import Foundation


struct JSONHelper {
    
    static func fetchArticles(completionHandler:([NewsArticle])-> ()){
    
        var newsList: [NewsArticle] = []
    
        let urlString = "http://api.nytimes.com/svc/news/v3/content/all/all/1.json?limit=20&offset=0&api-key=sample-key"
        
        NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: urlString)!) { (data, response, error) -> Void in
            
            
            
            if error != nil{
                print(error)
                return
            }
            
            do{
                let json = try(NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers))
                for dict in json["results"] as! [[String: AnyObject]]{
                    let article = NewsArticle()
                    
                    
                    if let title = dict["title"] as? String{
                        article.title = title
                    }
                    if let section = dict["section"] as? String{
                        article.section = section
                        article.setSectionColor()
                    }
                    if let subsection = dict["subsection"] as? String {
                        article.subsection = subsection
                    }
                    if let abstract = dict["abstract"] as? String {
                        article.abstract = abstract
                    }
                    if let url = dict["url"] as? String {
                        article.url = url
                    }
                    newsList.append(article)
                    
                }
                
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    completionHandler(newsList)
                })
                
                
            }catch let err{
                print(err)
            }
            
            
            }.resume()
    
    
    }

    
}