//
//  PostListViewControllerPresenter.swift
//  iosChallengeApp
//
//  Created by Andres Peguero on 4/26/17.
//  Copyright © 2017 Andres. All rights reserved.
//

import UIKit

class PostListViewControllerPresenter: UIViewController {

    @IBOutlet weak var PostListTableView: UITableView!
    
    @IBOutlet var userNotFoundView: UIView!
    
    var refreshControl: UIRefreshControl!
    
    var interactor = PostListInteractor()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setRefreshControl()
        
        self.userNotFoundView.isHidden = true 
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        if let row = self.PostListTableView.indexPathForSelectedRow {
            self.PostListTableView.deselectRow(at: row, animated: true)
        }
        
        self.interactor.retriever(presenter: self)
        
        
    }
    
    func setRefreshControl() {
        
        self.refreshControl = UIRefreshControl()
        
        self.refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        self.refreshControl.addTarget(self, action: #selector(self.refreshWithRetriver), for: .valueChanged)
        self.PostListTableView.addSubview(refreshControl)
    
    }
    
    func refreshWithRetriver() {
        self.interactor.retriever(presenter: self)
    }
    
    @IBAction func refreshButtonPressed(_ sender: Any) {
        self.refreshWithRetriver()
    }
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        // Go to settings view controller
        PostListRouter.showSettings(view: self)
    }

}

extension PostListViewControllerPresenter: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.interactor.list.count
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        let post = self.interactor.list[indexPath.row]
        
        print(post)
        
        PostListRouter.showDetail(view: self, post: post)
        
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 222
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostListItem", for: indexPath) as! PostListTableViewCell
        
        if self.interactor.list.count > 0 {
            
            let post = self.interactor.list[indexPath.row]
            
            cell.title.text = post.username
            
            cell.textDescription.text = post.description
            
            cell.backgroundImage.image = UIImage(data: post.imageData)
            
        }
        
        return cell
    }


}
