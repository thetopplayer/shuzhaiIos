//
//  BaiduOCRResponse.swift
//  shuzhai2
//
//  Created by VincentHe on 7/9/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit
import ObjectMapper

class BaiduOCRResponse: Mappable {
    var errNum:[String:Int]?
    var errMsg:String?
    var querySign:String?
    var retData:[BaiduOCRRetData]?
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    // Mappable
    func mapping(map: Map) {
        errNum   <- map["errNum"]
        errMsg   <- map["errMsg"]
        querySign <- map["querySign"]
        retData   <- map["retData"]
        
    }
}
