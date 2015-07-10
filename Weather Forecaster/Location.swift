//
//  Location.swift
//  Weather Forecaster
//
//  Created by Talha Babar on 7/9/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//

import SwiftyJSON

class Location {

    var city: String
    var country: String
    
    init(city: String, country: String) {
        self.city = city
        self.country = country
    }
    
    init(json: JSON) {
        self.city = json["query"]["results"]["channel"]["location"]["city"].string!
        self.country = json["query"]["results"]["channel"]["location"]["country"].string!
    }
}
