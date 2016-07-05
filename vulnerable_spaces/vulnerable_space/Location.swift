//
//  Location.swift
//  vulnerable_space
//
//  Created by George Witteman on 11/1/15.
//  Copyright © 2015 VC++. All rights reserved.
//

import Parse

class Location : PFObject, PFSubclassing {
    
    @NSManaged var longitude: Double
    @NSManaged var latitude: Double
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Location"
    }
}