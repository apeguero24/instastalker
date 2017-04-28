//
//  PostDetailInteractor.swift
//  iosChallengeApp
//
//  Created by Andres Peguero on 4/27/17.
//  Copyright © 2017 Andres. All rights reserved.
//

import Foundation
import Alamofire

class PostDetailInterator {
    
    var postDetail: PostDetailEntity
    
    var cachedImages = NSCache<AnyObject, AnyObject>()
    
    init(post: PostListEntity) {
        
        let id = post.id
        let username = post.username
        let url = post.imageUrl
        let description = post.description
        let likes = post.likes
        let imageData = post.imageData
        
        self.postDetail = PostDetailEntity(id: id, username: username, imageUrl: url, description: description, likes: likes, imageData: imageData)
        
    
    }
    
    /**
     This method sets the var postDetail comments array as [PostDetailEntity]
     
     - parameter comments: An NSArray with comments.
     - parameter view: A reference to the presenter (UIViewController) at hand.
     
     */
    func setComments(comments: NSArray, view: PostDetailPresenter) {
       
        for comment in comments {
            
            let dict = comment as! NSDictionary
            
            let id = dict.object(forKey: "id") as! String
            let text = dict.object(forKey: "text") as! String
            let from = dict.object(forKey: "from") as! NSDictionary
            let username = from.object(forKey: "username") as! String
            let imageUrl = from.object(forKey: "profile_picture") as! String
            
            if let imageCached = self.cachedImages.object(forKey: "\(imageUrl)" as AnyObject) as? Data {
                
                let temp = CommentEntity(id: id, username: username, profileImage: imageCached, imageUrl: imageUrl, text: text)

                self.postDetail.comments.append(temp)
                
                view.tableView.reloadData()
            
            } else {
            
                Alamofire.request(imageUrl).responseData(completionHandler: {  response in
                    
                    if let imageData = response.result.value {
                        
                        let temp = CommentEntity(id: id, username: username, profileImage: imageData, imageUrl: imageUrl, text: text)
                        
                        self.cachedImages.setObject(imageData as AnyObject, forKey: imageUrl as AnyObject)
                        
                        self.postDetail.comments.append(temp)
                        
                        view.tableView.reloadData()
                        
                    }
                    
                })
            }
        }
    
    }
}
