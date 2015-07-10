//
//  Wind.swift
//  Weather Forecaster
//
//  Created by Talha Babar on 7/9/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//

import SwiftyJSON

class Wind {
    
    var chill: String
    var direction: String
    var speed: String
    
    init(chill: String, direction: String, speed: String) {
        self.chill = chill
        self.direction = direction
        self.speed = speed
    }
    
    init(json: JSON) {
        self.chill = json["query"]["results"]["channel"]["wind"]["chill"].string!
        self.direction = json["query"]["results"]["channel"]["wind"]["direction"].string!
        self.speed = json["query"]["results"]["channel"]["wind"]["speed"].string!
        
    }

}
