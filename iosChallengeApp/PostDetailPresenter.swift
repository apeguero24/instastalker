//
//  PostDetailPresenter.swift
//  iosChallengeApp
//
//  Created by Andres Peguero on 4/27/17.
//  Copyright © 2017 Andres. All rights reserved.
//

import UIKit

class PostDetailPresenter: UIViewController {
    
    @IBOutlet var usernameTitle: UILabel!
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var likesView: UIView!
    
    var interactor: PostDetailInterator!
    
    // Passed on Route
    var post: PostListEntity!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.interactor = PostDetailInterator(post: self.post)
        
        self.interactor.setComments(comments: self.post.comments, view: self)
        
        self.usernameTitle.text = self.interactor.postDetail.username
        
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }

}

extension PostDetailPresenter: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return self.interactor.postDetail.comments.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 450
        }
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 450
        }
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let likes = self.interactor.postDetail.likes
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageDetail", for: indexPath) as! ImageDetailTableViewCell
            
            cell.selectionStyle = .none
            
            cell.detailImage.image = UIImage(data: self.post.imageData)
            
            cell.likes.text = String(likes)
            
            return cell
            
        } else {
            
            let image =  UIImage(data: self.interactor.postDetail.comments[indexPath.row].profileImage)
            let text = self.interactor.postDetail.comments[indexPath.row].text
            let username = self.interactor.postDetail.comments[indexPath.row].username
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "comment", for: indexPath) as! CommentTableViewCell
            
            cell.selectionStyle = .none
            
            cell.commentImage.image = image
            
            cell.commentImage.layer.masksToBounds = false
            cell.commentImage.layer.borderWidth = 1
            cell.commentImage.layer.borderColor = UIColor.darkGray.cgColor
            cell.commentImage.layer.cornerRadius = cell.commentImage.frame.size.width/2
            cell.commentImage.clipsToBounds = true
            
            cell.commentText.text = text
            
            cell.username.text = username
            
            return cell
        
        }
    }

}

