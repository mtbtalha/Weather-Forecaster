//
//  Condition.swift
//  Weather Forecaster
//
//  Created by Talha Babar on 7/9/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//



class Condition {

    var date : String
    var temperature : String
    var weatherText : String
    
    init(date: String, temperature: String, weatherText: String){
        self.date = date
        self.temperature = temperature
        self.weatherText = weatherText
    }
    
//    init(dict: Dictionary<String, AnyObject>) {
//       self.date = dict["results"]["channel"]["item"]["condition"]["date"]!
//       self.temperature = dict["results"]["channel"]["item"]["condition"]["temp"].string
//       self.weatherText = dict["results"]["channel"]["item"]["condition"]["text"].string
//    }
}
