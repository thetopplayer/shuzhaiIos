//
//  StoryTextBodyCell.swift
//  shuzhai2
//
//  Created by VincentHe on 7/4/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class StoryTextBodyCell: UITableViewCell {
    
    @IBOutlet var textBodyView:UITextView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}

class StoryCommentCell: UITableViewCell {
    
    @IBOutlet var commentTextView:UITextView?
    @IBOutlet var profileImg:UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
