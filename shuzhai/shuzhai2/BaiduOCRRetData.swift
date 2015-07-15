//
//  BaiduOCRRetData.swift
//  shuzhai2
//
//  Created by VincentHe on 7/9/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit
import ObjectMapper

class BaiduOCRRetData: Mappable {
    var rect_top:String?
    var rect_left:String?
    var rect_width:String?
    var rect_height:String?
    var word:String?
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    // Mappable
    func mapping(map: Map) {
        rect_top   <- map["rect.top"]
        rect_left   <- map["rect.left"]
        rect_width   <- map["rect.width"]
        rect_height   <- map["rect.height"]
        word   <- map["word"]

    }
}
