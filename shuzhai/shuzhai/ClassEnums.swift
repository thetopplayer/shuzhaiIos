//
//  ClassEnums.swift
//  shuzhai
//
//  Created by VincentHe on 6/23/15.
//  Copyright (c) 2015 com.Changchen. All rights reserved.
//

import UIKit

class ClassEnums {
    enum MainContentsControllers : String {
        case DailyReading = "segueDailyReading", UserProfile = "segueUserProfile"
        static let allValues = [DailyReading, UserProfile]
    }
}
