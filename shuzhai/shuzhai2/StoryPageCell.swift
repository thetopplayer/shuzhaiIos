//
//  StoryPageCell.swift
//  shuzhai2
//
//  Created by VincentHe on 6/30/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit
import ImageLoader

class StoryPageCell: UICollectionViewCell {
    @IBOutlet var bookTitleLabel:UILabel?
    @IBOutlet var bookSectionTitleLabel:UILabel?
    @IBOutlet var bookImgview:UIImageView?
    @IBOutlet var bookSummaryContentView:UITextView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
}
