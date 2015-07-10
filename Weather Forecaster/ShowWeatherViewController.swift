//
//  ShowWeatherViewController.swift
//  Weather Forecaster
//
//  Created by Talha Babar on 7/10/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//



class ShowWeatherViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var detailsTypeLabel: UILabel!
    @IBOutlet weak var characteristicLabel1: UILabel!
    @IBOutlet weak var valueLabel1: UILabel!
    @IBOutlet weak var characteristicLabel2: UILabel!
    @IBOutlet weak var valueLabel2: UILabel!
    @IBOutlet weak var characteristicLabel3: UILabel!
    @IBOutlet weak var valueLabel3: UILabel!
    
    var type : LocationWeatherViewController.Rows?
    var weatherCondition : Condition?
    var location : Location?
    var astronomy : Astronomy?
    var wind : Wind?
    var units : Units?
    
    override func viewDidLoad() {
        dateLabel.text = weatherCondition?.date
        locationLabel.text = "\(location!.city), \(location!.country)"
        
        switch(type!.rawValue) {
        case LocationWeatherViewController.Rows.Wind.rawValue:
            detailsTypeLabel.text = "Wind"
            detailsTypeLabel.font.fontWithSize(14.0)
            characteristicLabel1.text = "Chill"
            valueLabel1.text = "\(wind!.chill)\(units!.temperature)"
            characteristicLabel2.text = "Direction"
            valueLabel2.text = wind!.direction
            characteristicLabel3.text = "Speed"
            valueLabel3.text = "\(wind!.speed)\(units!.speed)"
            
        case LocationWeatherViewController.Rows.Weather.rawValue:
            detailsTypeLabel.text = "Weather"
            detailsTypeLabel.font.fontWithSize(14.0)
            characteristicLabel1.text = "Description"
            valueLabel1.text = weatherCondition!.weatherText
            characteristicLabel2.text = "Temperature"
            valueLabel2.text = "\(weatherCondition!.temperature!)\(units!.temperature)"
            characteristicLabel3.hidden = true
            valueLabel3.hidden = true
            
        case LocationWeatherViewController.Rows.Astronomy.rawValue:
            detailsTypeLabel.text = "Astronomy"
            detailsTypeLabel.font.fontWithSize(14.0)
            characteristicLabel1.text = "Sun Rise"
            valueLabel1.text = astronomy!.sunRise
            characteristicLabel2.text = "Sun Set"
            valueLabel2.text = astronomy!.sunSet
            characteristicLabel3.hidden = true
            valueLabel3.hidden = true
        
        default: println("L")
        }
        
    }
}