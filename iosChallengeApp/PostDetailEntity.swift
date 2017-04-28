//
//  PostDetailEntity.swift
//  iosChallengeApp
//
//  Created by Andres Peguero on 4/27/17.
//  Copyright © 2017 Andres. All rights reserved.
//

import Foundation
import Alamofire

struct PostDetailEntity {
    var id: String
    var imageUrl: String
    var description: String
    var username: String
    var likes: Int
    var imageData: Data?
    var comments = [CommentEntity]()
    
    init() {
        self.id = ""
        self.imageUrl = ""
        self.description = ""
        self.username = ""
        self.likes = 0
    }
    
    init(id: String, username: String, imageUrl: String, description: String, likes: Int, imageData: Data) {
        self.id = id
        self.imageUrl = imageUrl
        self.description = description
        self.username = username
        self.likes = likes
    }

}
