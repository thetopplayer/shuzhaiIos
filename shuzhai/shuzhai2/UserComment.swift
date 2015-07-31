//
//  UserComment.swift
//  shuzhai2
//
//  Created by VincentHe on 7/27/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit
import ObjectMapper


class UserComment: Mappable {
    var response:Bool?
    var messages:[UserCommentMessage]?

    func mapping(map: Map) {
        response        <- map["response"]
        messages        <- map["message"]
        
    }
    
    required init?(_ map: Map) {
        mapping(map)
    }

}


class UserCommentMessage:Mappable{
    
    var commentId:Int?
    var userInfoId:Int?
    var userName:String?
    var nickName:String?
    var profileImg:String?
    var email:String?
    var phoneNumber:Int?
    var createdDate:Int?
    var isAdmin:Bool?
    var loginSource:String?
    var comment:String?
    
    func mapping(map: Map) {
        commentId       <- map["commentId"]
        userInfoId      <- map["creatorUserInfo.userInfoId"]
        userName        <- map["creatorUserInfo.username"]
        nickName        <- map["creatorUserInfo.nickname"]
        
        profileImg      <- map["creatorUserInfo.profileImg"]
        email           <- map["creatorUserInfo.email"]
        phoneNumber     <- map["creatorUserInfo.phoneNumber"]
        createdDate     <- map["createdTime"]
        isAdmin         <- map["creatorUserInfo.isAdmin"]
        loginSource     <- map["creatorUserInfo.loginSource"]
        comment         <- map["comment"]

        
    }
    
    required init?(_ map: Map) {
        mapping(map)
    }

}