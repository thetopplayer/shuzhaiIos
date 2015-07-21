//
//  User.swift
//  shuzhai2
//
//  Created by VincentHe on 7/20/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit
import ObjectMapper


class User: Mappable {
    var response:Bool?
    var userInfoId:Int?
    var userName:String?
    var nickName:String?
    var profileImg:String?
    var email:String?
    var phoneNumber:Int?
    var createdDate:Int?
    var followingCount:Int?
    var followerCount:Int?
    var userBooks:[DaliyReadingBook]?
    // Mappable
    func mapping(map: Map) {
        response        <- map["response"]
        userInfoId      <- map["message.userInfoId"]
        userName        <- map["message.username"]
        nickName        <- map["message.nickname"]
        
        profileImg      <- map["message.profileImg"]
        email           <- map["message.email"]
        phoneNumber     <- map["message.phoneNumber"]
        createdDate     <- map["message.createdDate"]
        
        followingCount  <- map["message.followingCount"]
        followerCount   <- map["message.followerCount"]
        userBooks       <- map["message.userBooks"]
        
    }
    
    required init?(_ map: Map) {
        mapping(map)
    }
}
