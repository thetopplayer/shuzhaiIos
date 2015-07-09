//
//  StoryUtilCell.swift
//  shuzhai2
//
//  Created by VincentHe on 7/5/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class StoryUtilCell: UITableViewCell {
    @IBOutlet var profileImg:UIImageView?
    @IBOutlet var userNameLabel:UILabel?
    @IBOutlet var likeButton:UIButton?
    @IBOutlet var markButton:UIButton?
    @IBOutlet var shareButton:UIButton?
    @IBOutlet var containerView:UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
