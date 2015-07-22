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
import JavaScriptCore
import ObjectMapper


struct GlobalVariables {
    static var dailyStoryUrl = "http://104.131.79.31/onebook/book/getSingleRecommendationBook.form"
    static var mutilStoryUrl = "http://104.131.79.31/onebook/book/getMultipleRecommendationBook.form"
    static var baiduOCRUrl = "http://apis.baidu.com/apistore/idlocr/ocr"
    static var createUserUrl = "http://104.131.79.31/onebook/user/createUser.form"
    static var loginUserUrl = "http://104.131.79.31/onebook/user/userLogin.form"
    static var getUserInfoUrl = "http://104.131.79.31/onebook/user/getUserInfo.form"
    static var readingFetchDefaultNumb = 5
    static var defaultColorGroup = [UIColor.peterRiverColor(),UIColor.carrotColor(),UIColor.nephritisColor(),UIColor.sunflowerColor(),UIColor.wisteriaColor(),UIColor.midnightBlueColor(),UIColor.turquoiseColor()]
}


enum Router: URLRequestConvertible {
    static let baseUrlString = "someUrl"
    
    case Get(url: String)
    
    var URLRequest: NSURLRequest {
        let path: String = {
            switch self {
            case .Get(let url):
                return "/\(url)"
            }
            }()
        
        let URL = NSURL(string: Router.baseUrlString)!
        let URLRequest = NSMutableURLRequest(URL:
            URL.URLByAppendingPathComponent(path))
        
        // set header fields
        URLRequest.setValue("application/json",
            forHTTPHeaderField: "Content-Type")
        URLRequest.setValue("application/json",
            forHTTPHeaderField: "Accept")
        
        return URLRequest.0
    }
}

enum LoginStatus{
    case userCreated
    case userLogin
    case userExsistError
    case userCreationFailedError
}

class Util:NSObject{

    static func getLocalUserAuthentication()->String?
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let userMetaDict:Dictionary = defaults.dictionaryForKey("userAuthentication")
        {
            return userMetaDict["token"] as? String
        }
        return nil
    }
    
    static func getLocalUserName()->String?
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let userMetaDict:Dictionary = defaults.dictionaryForKey("userAuthentication")
        {
            return userMetaDict["userName"] as? String
        }
        return nil
    }
    
    static func setLocalUserAnthentication(userName:String,anthentication:String)
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(["userName":userName,"token":anthentication], forKey: "userAuthentication")
    }

    
    static func getNavigationMenuButton() -> UIButton
    {
        var button: UIButton = UIButton()
        button.setImage(UIImage(named: "Berger1"), forState: .Normal)
        button.frame = CGRectMake(0, 0, 30, 30)
        return button
    }
    
    static func syncUserInfoToLocal(userName:String?, complete:(Bool)->Void)
    {
        DataManager.getUserInformation(userName, completionHandler: { (user:User?, error) -> Void in
            if error == nil
            {
                if let user = user{
                    Util.saveUserObjectToPlist(user)
                }
                complete(true)
            }else
            {
                complete(false)
            }
        })
    }
    
    static func getLocalUserAsObject()->User?
    {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as! NSString
        let path = documentsDirectory.stringByAppendingPathComponent("userInfo.plist")
        
        //var JSONString = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)!
        let user = Mapper<User>().map(NSDictionary(contentsOfFile: path))
        return user
    }
    
    static func saveUserObjectToPlist(user:User)
    {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as! NSString
        let path = documentsDirectory.stringByAppendingPathComponent("userInfo.plist")
        
        NSDictionary(dictionary: Mapper().toJSON(user)).writeToFile(path, atomically: true)
        
        var text = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)!
        println(path)
    }
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
        
        Alamofire.request(.POST, GlobalVariables.mutilStoryUrl, parameters: ["startDate": ndaysAgoStr,"endDate":todayStr],encoding:ParameterEncoding.TEXT)
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
    
    static func fetchResultFromBaiduOCR(image:UIImage,completionHandler:(BaiduOCRResponse?,NSError?)->Void){
        
        var base64String:String = image.autoResizeToDataWithSize800x600.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.allZeros)

        // encode '+' as '%2b' 不然会逃离+
        base64String = base64String.stringByReplacingOccurrencesOfString("+", withString: "%2b", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        var paramters = ["fromdevice":"iPhone","detecttype":"LocateRecognize","languagetype":"CHN_ENG","imagetype":"1","image":base64String,"clientip":"10.10.10.0"]
        Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders = ["apikey":"e6a34edc9cae321d7919d40931e4c497"]
        
        Alamofire.request(.POST, GlobalVariables.baiduOCRUrl, parameters: paramters,encoding:ParameterEncoding.TEXT)
            .responseString(encoding: NSUTF8StringEncoding) { (_, _, jsonStr, error) -> Void in
                var jsonStr  = DataManager.jsParser(jsonStr!)
                println(jsonStr)
                let ocrResponse = Mapper<BaiduOCRResponse>().map(jsonStr)
                completionHandler(ocrResponse,error)
                println(ocrResponse)
            }
    }
    
    static func getUserInformation(userName:String?, completionHandler:(User?,NSError?)->Void)
    {
        Alamofire.request(.POST, GlobalVariables.getUserInfoUrl, parameters: ["username": userName!], encoding:ParameterEncoding.TEXT)
            .debugLog()
            .responseObject { (user: User?, error: NSError?) in
                if user != nil
                {
                    completionHandler(user,nil)
                }else
                {
                    completionHandler(nil,error)
                }
        }
    }
    
    
    static func createOrLoginNewUser(userName:String,userEmail:String,userPassword:String,funcCompletionHandler:(Bool,AnyObject?,LoginStatus)->Void)
    {
        var paramters = ["username":userName,"password":userPassword,"email":userEmail]
        Alamofire.request(.POST, GlobalVariables.createUserUrl, parameters: paramters,encoding:ParameterEncoding.TEXT)
            .responseJSON(options: NSJSONReadingOptions.allZeros) { (_, _, json, error) -> Void in
                if error == nil
                {
                    var response = json as! NSDictionary
                    var success = response.objectForKey("response") as! Bool
                    var message: AnyObject? = response.objectForKey("message")
                
                    if (success == false && message?.isEqual("existing user") == true)
                    {
                        // go to login user
                        Alamofire.request(.POST,GlobalVariables.loginUserUrl,parameters: paramters,encoding: ParameterEncoding.TEXT)
                        .responseJSON(options: NSJSONReadingOptions.allZeros, completionHandler: { (_, _, jsonLogin, errorLogin) -> Void in
                            var response = jsonLogin as! NSDictionary
                            var success = response.objectForKey("response") as! Bool
                            var message: AnyObject? = response.objectForKey("message")
                            
                            if success
                            {
                                funcCompletionHandler(success,message,.userLogin)
                            }else
                            {
                                funcCompletionHandler(success,message,.userExsistError)
                            }
                        })
                        
                    }else if success
                    {
                        //funcCompletionHandler(success,message,.userCreated)
                        // go to login user
                        Alamofire.request(.POST,GlobalVariables.loginUserUrl,parameters: paramters,encoding: ParameterEncoding.TEXT)
                            .responseJSON(options: NSJSONReadingOptions.allZeros, completionHandler: { (_, _, jsonLogin, errorLogin) -> Void in
                                var response = jsonLogin as! NSDictionary
                                var success = response.objectForKey("response") as! Bool
                                var message: AnyObject? = response.objectForKey("message")
                                
                                if success
                                {
                                    funcCompletionHandler(success,message,.userLogin)
                                }else
                                {
                                    funcCompletionHandler(success,message,.userExsistError)
                                }
                            })
                    }else
                    {
                        funcCompletionHandler(success,message,.userCreationFailedError)
                    }
                   
                }else
                {
                    funcCompletionHandler(false,"",.userCreationFailedError)
                }
            }
 
    }
    

    
    
    static func jsParser(json:String) -> String
    {
        let context = JSContext()
//        let JSON = context.objectForKeyedSubscript("JSON")
//        let JSONparse = JSON.objectForKeyedSubscript("parse")
//        let JSONString = json
//        let parsed = JSONparse.callWithArguments([JSONString])
//        var parsedDict = parsed.toDictionary()!
        
        context.evaluateScript("var convertor = function(json) {var obj = JSON.parse(json); return JSON.stringify(obj);}")
        let jsonFunction = context.objectForKeyedSubscript("convertor")
        let result = jsonFunction.callWithArguments([json]).toString()
        return result
    }
    
    
}




