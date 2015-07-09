//
//  GlobalObserver.swift
//  shuzhai2
//
//  Created by VincentHe on 7/8/15.
//  Copyright (c) 2015 VincentHe. All rights reserved.
//

import UIKit

class GlobalObservable: NSObject {
    dynamic var mainMenuOpenAndCloseStatus = 0
    static let sharedInstance = GlobalObservable()
}
