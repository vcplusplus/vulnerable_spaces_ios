//
//  Location.swift
//  vulnerable_space
//
//  Created by George Witteman on 11/1/15.
//  Copyright © 2015 VC++. All rights reserved.
//

#import <Parse/PFObject+Subclass.h>

class Location : PFObject, PFSubclassing {
    
    @NSManaged var longitude: Int
    @NSManaged var latitude: Int
    
    override class func initialize(longitude: Int, latitude: Int) {
        self.longitude = longitude
        self.latitude = latitude
    }
    
    static func parseClassName() -> String {
        return "Location"
    }
}