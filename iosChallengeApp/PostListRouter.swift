//
//  PostListRoute.swift
//  iosChallengeApp
//
//  Created by Andres Peguero on 4/26/17.
//  Copyright © 2017 Andres. All rights reserved.
//

import Foundation
import UIKit

struct PostListRouter {
    
    /**
     This static method routes to the post detail view
     
     - parameter view: A reference to the presenter (UIViewController) at hand.
     - parameter post: Access to the single post value to be passed to upcoming view.
     
     */
    static func showDetail(view: UIViewController, post: PostListEntity) {
        
        let storyboard = UIStoryboard(name: "PostDetail", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "PostDetail") as! PostDetailPresenter
        
        vc.post = post
        
        view.present(vc, animated: true, completion: nil)
    }
    
    /**
     This static method routes to the post settings view
     
     - parameter view: A reference to the presenter (UIViewController) at hand.
     
     */
    static func showSettings(view: UIViewController) {
        
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "settings") as! SettingsPresenter
        
        view.present(vc, animated: true, completion: nil)
    }
}
