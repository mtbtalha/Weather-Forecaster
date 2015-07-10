//
//  Units.swift
//  Weather Forecaster
//
//  Created by Talha Babar on 7/9/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//

import SwiftyJSON

class Units {

    var distance: String
    var speed: String
    var temperature: String
    
    init(distance: String, speed: String, temperature: String) {
        self.distance = distance
        self.speed = speed
        self.temperature = temperature
    }
 
    init(json: JSON) {
        self.distance = json["query"]["results"]["channel"]["units"]["distance"].string!
        self.speed = json["query"]["results"]["channel"]["units"]["speed"].string!
        self.temperature = json["query"]["results"]["channel"]["units"]["temperature"].string!
    }
}
