//
//  ImageDetailTableViewCell.swift
//  iosChallengeApp
//
//  Created by Andres Peguero on 4/27/17.
//  Copyright © 2017 Andres. All rights reserved.
//

import UIKit

class ImageDetailTableViewCell: UITableViewCell {

    @IBOutlet var likes: UILabel!
    
    @IBOutlet var detailImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
