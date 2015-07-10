//
//  Condition.swift
//  Weather Forecaster
//
//  Created by Talha Babar on 7/9/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//

import SwiftyJSON


class Condition {

    var date : String?
    var temperature : String?
    var weatherText : String?
    
    init(date: String, temperature: String, weatherText: String){
        self.date = date
        self.temperature = temperature
        self.weatherText = weatherText
    }
    
    init(json: JSON) {
        self.date = json["query"]["results"]["channel"]["item"]["condition"]["date"].string
        self.temperature = json["query"]["results"]["channel"]["item"]["condition"]["temp"].string
        self.weatherText = json["query"]["results"]["channel"]["item"]["condition"]["text"].string
    }
}
