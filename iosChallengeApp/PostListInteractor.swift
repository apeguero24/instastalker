//
//  PostListInteractor.swift
//  iosChallengeApp
//
//  Created by Andres Peguero on 4/26/17.
//  Copyright © 2017 Andres. All rights reserved.
//

import Foundation
import Alamofire

class PostListInteractor: PostListInteractorProtocol {
    
    var list = [PostListEntity]()
    
    let imageCache = NSCache<AnyObject, AnyObject>()
    
    
    /**
      This method retrives the Instagram posts using Alamorefire
     
     - parameter presenter: A reference to the presenter at hand.
     
     */
    func retriever(presenter: PostListViewControllerPresenter) {
        
        self.list.removeAll()
        
        Alamofire.request(InstagramUser.url()).responseJSON(completionHandler: { response in
            
            if let JSON = response.result.value as? NSDictionary {
                
                self.userFound(presenter: presenter)
                
                if  let items = JSON.object(forKey: "items") as? NSArray {
                
                    if items.count > 0 {
                        
                        for item in items {
                            
                            if let picture = item as? NSDictionary {
                                
                                let id = picture.object(forKey: "id") as! String
                                
                                let images = picture.object(forKey: "images") as! NSDictionary
                                let res = images.object(forKey: "standard_resolution") as! NSDictionary
                                let imageUrl = res.object(forKey: "url") as! String
                                
                                let caption = picture.object(forKey: "caption") as! NSDictionary
                                
                                let description = caption.object(forKey: "text") as! String
                                
                                let from = caption.object(forKey: "from") as! NSDictionary
                                let username = from.object(forKey: "username") as! String
                                
                                let likes = picture.object(forKey: "likes") as! NSDictionary
                                let count = likes.object(forKey: "count") as! Int
                                
                                let commentsData = picture.object(forKey: "comments") as! NSDictionary
                                let comments = commentsData.object(forKey: "data") as? NSArray ?? NSArray()
                                
                                // Checks if the images are in the cache, if not retrieves them 
                                
                                if let cachedImage = self.imageCache.object(forKey: "\(imageUrl)" as AnyObject) as? Data {
                                    
                                    let post = PostListEntity(id: id, imageUrl: imageUrl, description: description, username: username, likes: count, imageData: cachedImage, comments: comments)
                                    
                                    self.list.append(post)
                                    
                                } else {
                                
                                    Alamofire.request(imageUrl).responseData(completionHandler: { response in
                                        
                                        if let imageData = response.result.value {
                                            
                                            self.imageCache.setObject(imageData as AnyObject, forKey: imageUrl as AnyObject)
                                            
                                            let post = PostListEntity(id: id, imageUrl: imageUrl, description: description, username: username, likes: count, imageData: imageData, comments: comments)

                                            self.list.append(post)
                                            
                                            presenter.PostListTableView.reloadData()
                                        }
                                    
                                    })
                                }
                            }
                        }
                        
                        presenter.PostListTableView.reloadData()
                        
                        presenter.refreshControl.endRefreshing()
                    
                    } else {
                        
                        self.errorFindingUser(presenter: presenter)
                    }
                }
                
            }  else {
                
                self.errorFindingUser(presenter: presenter)
                
            }
        })
    }
    
    /**
     This method wraps the error handling in case there's no data to show
     
     - parameter presenter: A reference to the presenter (UIViewController) at hand.
     
     */
    func errorFindingUser(presenter: PostListViewControllerPresenter) {
        
        presenter.PostListTableView.isHidden = true
        
        presenter.userNotFoundView.isHidden = false
    
    }
    
    /**
     This method wraps the success handling in case there's data to show
     
     - parameter presenter: A reference to the presenter (UIViewController) at hand.
     
     */
    func userFound(presenter: PostListViewControllerPresenter) {
        
        presenter.PostListTableView.isHidden = false
        
        presenter.userNotFoundView.isHidden = true
    
    }
    
    
}
