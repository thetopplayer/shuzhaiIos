//
//  Shared.swift
//  shuzhai2
//
//  Created by VincentHe on 6/30/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

struct GlobalVariables {
    static var dailyStoryUrl = "http://104.131.79.31/onebook/book/getSingleRecommendationBook.form"
    static var mutilStoryUrl = "http://104.131.79.31/onebook/book/getMultipleRecommendationBook.form"
    static var readingFetchDefaultNumb = 5
}


class DataManager: NSObject {
    static func fetchTodayBook(completionHandler:(DailyReading?,NSError?)->Void){
        
        Alamofire.request(.POST, GlobalVariables.dailyStoryUrl, parameters: ["requestDate": "2015-06-17"])
            .responseObject { (response: DailyReading?, error: NSError?) in
                
                if response != nil
                {
                    completionHandler(response,nil)
                }else
                {
                    completionHandler(nil,error)
                }
        }
    
    }
    
    static func fetchNumberOfBooks(completionHandler:([DailyReading]?,NSError?)->Void){
        
        let calendar = NSCalendar.currentCalendar()
        let today = calendar.dateByAddingUnit(.CalendarUnitDay, value: 0, toDate: NSDate(), options: nil)
        let ndaysAgo = calendar.dateByAddingUnit(.CalendarUnitDay, value: -GlobalVariables.readingFetchDefaultNumb, toDate: NSDate(), options: nil)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // superset of OP's format
        let todayStr = dateFormatter.stringFromDate(today!)
        let ndaysAgoStr = dateFormatter.stringFromDate(ndaysAgo!)

        
        
        Alamofire.request(.POST, GlobalVariables.mutilStoryUrl, parameters: ["startDate": ndaysAgoStr,"endDate":todayStr])
            .responseArray { (response: [DailyReading]?, error: NSError?) in
                
                if response != nil
                {
                    completionHandler(response,nil)
                }else
                {
                    completionHandler(nil,error)
                }
        }
    }
}