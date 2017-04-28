//
//  InstagramUser.swift
//  iosChallengeApp
//
//  Created by Andres Peguero on 4/27/17.
//  Copyright © 2017 Andres. All rights reserved.
//

import Foundation

struct InstagramUser {
    
    static var username: String = "diegomedbernal"
    
    /**
     This static changes the value of the static var username for global access
     
     - parameter newUsername: A reference to the presenter (UIViewController) at hand.
     - parameter post: Access to the single post value to be passed to upcoming view.
     
     */
    static func changeUser(newUsername: String) {
        self.username = newUsername
    }
    
    /**
     This static gives you access to the instagram url with given username.
     
     - returns: returns a string url.
     
     */
    static func url() -> String {
        return "https://www.instagram.com/\(self.username)/media"
    }
    
}
