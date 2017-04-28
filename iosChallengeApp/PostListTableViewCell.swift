//
//  PostListTableViewCell.swift
//  iosChallengeApp
//
//  Created by Andres Peguero on 4/26/17.
//  Copyright © 2017 Andres. All rights reserved.
//

import UIKit

class PostListTableViewCell: UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var textDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
