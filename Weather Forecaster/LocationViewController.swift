//
//  LocationViewController.swift
//  Weather Forecaster
//
//  Created by Talha Babar on 7/8/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//


class LocationViewController: UIViewController {
    

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    
    var locationCoodinates : CLLocationCoordinate2D?
    let locationConditionSegueIdentifier = "LocationConditionSegue"
    var locationText : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func getCoordinates(){
        let geocoder = CLGeocoder()
        let address = locationTextField.text
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks: [AnyObject]!, error: NSError!) in
            
            if error != nil {
                println("Geocode failed with error: \(error.localizedDescription)")
            } else if placemarks.count > 0 {
                let placemark = placemarks[0] as! CLPlacemark
                let location = placemark.location
                self.locationText  = address
                self.locationCoodinates = location.coordinate
                println("\(self.locationCoodinates?.longitude) , \(self.locationCoodinates?.latitude)")
            
                if self.locationCoodinates != nil {
                    self.performSegueWithIdentifier(self.locationConditionSegueIdentifier, sender: self)
                } else {
                    println("ERROR//: Please Enter Location")
                }

            }
        })
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == locationConditionSegueIdentifier) {
            let svc = segue.destinationViewController as! LocationWeatherViewController;
            svc.fetchedLocationCoordinates = locationCoodinates
            svc.location = locationText
        }

    }
    
    @IBAction func checkWeatherAction(sender: AnyObject) {
        getCoordinates()
    }
}
