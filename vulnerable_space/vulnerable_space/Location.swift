//
//  Location.swift
//  vulnerable_space
//
//  Created by George Witteman on 11/1/15.
//  Copyright © 2015 VC++. All rights reserved.
//

import Foundation

public struct Location {
    
    var longitude: Int
    var latitude: Int
    
    public init(longitude: Int, latitude: Int) {
        self.longitude = longitude
        self.latitude = latitude
    }
    
}