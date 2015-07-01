//
//  DailyReading.swift
//  shuzhai2
//
//  Created by VincentHe on 6/30/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class DailyReading: Mappable {
    var recommendedBookId:Int?
    var recommendedDate:String?
    var bookInfoVO:DaliyReadingBook?
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    // Mappable
    func mapping(map: Map) {
        recommendedBookId    <- map["recommendedBookId"]
        recommendedDate      <- map["recommendedDate"]
        bookInfoVO           <- map["bookInfoVO"]
    }
}
