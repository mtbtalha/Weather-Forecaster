//
//  Astronomy.swift
//  Weather Forecaster
//
//  Created by Talha Babar on 7/9/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//

import SwiftyJSON

class Astronomy {
    
    var sunRise: String
    var sunSet: String
    
    init(sunRise: String, sunSet: String) {
        self.sunRise = sunRise
        self.sunSet = sunSet
    }
    
    init(json: JSON) {
        self.sunRise = json["query"]["results"]["channel"]["astronomy"]["sunrise"].string!
        self.sunSet = json["query"]["results"]["channel"]["astronomy"]["sunset"].string!
    }

}
