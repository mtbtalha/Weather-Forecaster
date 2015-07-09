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
    var fetchedLocationCoordinates : CLLocationCoordinate2D?
    var location : String = ""
    
    private enum Rows : Int {
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
        var recievedJSON = JSON(results!)
//        if let queries: AnyObject = results[query] {
//            println(queries)
//        }
        
//        println("\(results[query][count])")
        
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
        case Rows.Wind.rawValue: println("Wind")
        case Rows.Weather.rawValue: println("Weather")
        case Rows.Astronomy.rawValue: println("Astronomy")
        default: println("L")
        }
    }
}
