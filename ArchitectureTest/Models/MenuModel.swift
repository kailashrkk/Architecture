//
//  MenuModel.swift
//  ArchitectureTest
//
//  Created by Kailash on 7/29/18.
//  Copyright © 2018 Kailash. All rights reserved.
//

import Foundation

struct Menu {
    enum menuType:String {
        case Profile
        case Chat
        case Terms
        case Logout
    
        static var all : [menuType] {
            return [menuType.Profile, .Chat, .Terms, .Logout];
        }
    }
}
