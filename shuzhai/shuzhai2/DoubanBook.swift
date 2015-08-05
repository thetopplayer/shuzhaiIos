//
//  DoubanBook.swift
//  shuzhai2
//
//  Created by VincentHe on 8/3/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit
import ObjectMapper

class DoubanBook:Mappable{
    var books:[DoubanBookInfo]?
    
    func mapping(map: Map) {
        books <- map["books"]
    }
    
    required init?(_ map: Map) {
        mapping(map)
    }

}


class DoubanBookInfo: Mappable {
    var rating_max:Int?
    var rating_numRaters:Double?
    var rating_average:String?
    var rating_min:Int?
    var subtitle:String?
    var author:[String]?
    var pubDate:String?
    var origin_title:String?
    var imgUrl:String?
    var publisher:String?
    var title:String?
    var author_intro:String?
    var summary:String?
    var price:String?
    var catalog:String?
    var bookTags:[DoubanBookTag]?
    
    // Mappable
    func mapping(map: Map) {
        rating_max        <- map["rating.max"]
        rating_numRaters      <- map["rating.numRaters"]
        rating_average        <- map["rating.average"]
        rating_min        <- map["rating.min"]
        
        subtitle      <- map["subtitle"]
        author           <- map["author"]
        pubDate     <- map["pubdate"]
        origin_title     <- map["origin_title"]
        
        imgUrl  <- map["images.large"]
        catalog <- map["catalog"]
        publisher   <- map["publisher"]
        title       <- map["title"]
        
        author_intro  <- map["author_intro"]
        summary   <- map["summary"]
        price       <- map["price"]
        bookTags        <- map["tags"]
    }
    
    required init?(_ map: Map) {
        mapping(map)
    }

}

class DoubanBookTag:Mappable{

    var count:Int?
    var name:String?
    var title:String?
    
    func mapping(map: Map){
        
        count        <- map["count"]
        name        <- map["name"]
        title        <- map["title"]
    }
    
    required init?(_ map: Map) {
        mapping(map)
    }

}
