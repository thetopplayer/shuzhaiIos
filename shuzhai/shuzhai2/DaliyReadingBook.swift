//
//  DaliyReadingBook.swift
//  shuzhai2
//
//  Created by VincentHe on 6/30/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit
import ObjectMapper

class DaliyReadingBook: Mappable {
    var bookInfoId:Double?
    var category:String?
    var bookTitle:String?
    var url:String?
    var summary:String?
    var author:String?
    var createTime:Double?
    var tags:[String]?
    var intro:String?
    var textBody:String?
    var sectionTitle:String?
    var imgsUrl:[String]?
    var bookscore:Int?
    var machineScore:Int?
    var creatorComments:String?
    var creator_UserId:Int?
    var creator_userName:String?
    var creator_nikeName:String?
    var creator_profileImg:String?
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    // Mappable
    func mapping(map: Map) {
        bookInfoId    <- map["bookInfoId"]
        category      <- map["category"]
        bookTitle     <- map["bookTitle"]
        bookTitle     <- map["bookTitle"]
        summary       <- map["summary"]
        author        <- map["author"]
        createTime    <- map["createTime"]
        tags          <- map["tags"]
        intro         <- map["intro"]
        textBody      <- map["textBody"]
        sectionTitle  <- map["sectionTitle"]
        imgsUrl       <- map["imgsUrl"]
        bookscore     <- map["bookscore"]
        machineScore        <- map["machineScore"]
        creatorComments     <- map["creatorComments"]
        creator_userName    <- map["creator.userInfoId"]
        creator_userName    <- map["creator.username"]
        creator_nikeName    <- map["creator.nickname"]
        creator_profileImg  <- map["creator.profileImg"]
    }
    
}
