//
//  LocationWeatherViewController.swift
//  Weather Forecaster
//
//  Created by Talha Babar on 7/9/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//

import SwiftyJSON

class LocationWeatherViewController: UIViewController, GMSMapViewDelegate, UITableViewDataSource, UITableViewDelegate {

  
    @IBOutlet weak var mapUIView: UIView!
    @IBOutlet weak var tableView: UITableView!
   
    let cellIdentifier = "CellIdentifier"
    let showWeatherSegueIdentifier = "ShowWeatherSegueIdentifier"
    var fetchedLocationCoordinates : CLLocationCoordinate2D?
    var location : String = ""
    var VCType : Rows?
    var tempConditions : Condition?
    var locationText : Location?
    var astronomy : Astronomy?
    var wind : Wind?
    var units : Units?
    
        enum Rows : Int {
        case Wind = 0
        case Weather
        case Astronomy
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeMapView()
        tableView.dataSource = self
        tableView.delegate = self
        let query = "query"
        let count = "count"
        var yql = YQL()
        let queryString = "select * from weather.forecast where woeid in (select woeid from geo.places(1) where text=\"\(location)\")"
        var results = yql.query(queryString)
        var recievedJSON = JSON (data: results!, error: nil)
      
        tempConditions = Condition(json: recievedJSON)
        locationText = Location(json: recievedJSON)
        astronomy = Astronomy(json: recievedJSON)
        wind = Wind(json: recievedJSON)
        units = Units(json: recievedJSON)
        
        
    }
    
    func initializeMapView(){
        let camera = GMSCameraPosition.cameraWithLatitude(fetchedLocationCoordinates!.latitude,
            longitude: fetchedLocationCoordinates!.longitude, zoom: 9)
        let mapView = GMSMapView.mapWithFrame(CGRectMake(0, 0, self.mapUIView.frame.size.width, self.mapUIView.frame.size.height), camera: camera)
        mapView.myLocationEnabled = true
        self.mapUIView.addSubview(mapView)
        self.view.addSubview(mapUIView)
        mapView.delegate = self
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == showWeatherSegueIdentifier) {
            let svc = segue.destinationViewController as! ShowWeatherViewController;
            svc.type = VCType
            svc.weatherCondition = tempConditions
            svc.location = locationText
            svc.astronomy = astronomy
            svc.wind = wind
            svc.units = units
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        switch (indexPath.row) {
        case Rows.Wind.rawValue: cell.textLabel?.text = "Wind"
        case Rows.Weather.rawValue: cell.textLabel?.text = "Weather"
        case Rows.Astronomy.rawValue: cell.textLabel?.text = "Astronomy"
        default: cell.textLabel?.text = ""
        }
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch (indexPath.row) {
        case Rows.Wind.rawValue:
            println("Wind")
            VCType = Rows.Wind
            performSegueWithIdentifier(showWeatherSegueIdentifier, sender: self)
        case Rows.Weather.rawValue:
            println("Weather")
            VCType = Rows.Weather
            performSegueWithIdentifier(showWeatherSegueIdentifier, sender: self)
        case Rows.Astronomy.rawValue:
            println("Astronomy")
            VCType = Rows.Astronomy
            performSegueWithIdentifier(showWeatherSegueIdentifier, sender: self)
        default: println("L")
        }
    }
}
