//
//  MapController.swift
//  Flattire
//
//  Created by Arsen Gasparyan on 21/02/16.
//  Copyright © 2016 Arsen Gasparyan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    private let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    // MARK: - Actions
    
    @IBAction func zoomIn(sender: UIButton) {
        var region = mapView.region
        region.span.latitudeDelta /= 3.0
        region.span.longitudeDelta /= 3.0
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func zoomOut(sender: UIButton) {
        var region = mapView.region
        region.span.latitudeDelta = min(region.span.latitudeDelta  * 3.0, 180.0)
        region.span.longitudeDelta = min(region.span.longitudeDelta  * 3.0, 180.0)
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func findMe(sender: UIButton) {
        var region = mapView.region
        region.center = mapView.userLocation.coordinate
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02
        mapView.setRegion(region, animated: true)
    }
    
    // MARK: - CLLocationManagerDelegate
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
