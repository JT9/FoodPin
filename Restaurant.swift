//
//  Restaurant.swift
//  FoodPin
//
//  Created by C T on 10/14/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation


class Restaurant {
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var isVisited = false
    var phone = ""
    
    init(name: String, type: String, location: String, phone: String, image: String, isVisited: Bool) {
        
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.image = image
        self.isVisited = isVisited
    }
}
