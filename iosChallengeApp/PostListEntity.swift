//
//  PostListEntity.swift
//  iosChallengeApp
//
//  Created by Andres Peguero on 4/26/17.
//  Copyright © 2017 Andres. All rights reserved.
//

import Foundation

struct PostListEntity {
    var id: String
    var imageUrl: String
    var description: String
    var username: String
    var likes: Int
    var imageData: Data
    var comments: NSArray
    
}
