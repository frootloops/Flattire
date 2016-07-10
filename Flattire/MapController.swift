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
import Alamofire
import AlamofireObjectMapper
import Moya
import PhoneNumberKit

class MapController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    private let locationManager = CLLocationManager()
    private var needToMoveToUserLocation = true
    private var products = [UberProduct]()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareForUse()
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        let phone = try! PhoneNumber(rawNumber: "+79999808630")
        FlattireProvider.request(.TokenRequest(phone)) { result in
            switch result {
            case .Success(let response):
                print(response)
            case .Failure(let error):
                print(error)
            }
        }
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
        moveToUserLocation()
    }
}

private extension MapController {
    // MARK: - Helpers
    
    private func prepareForUse() {
        let center = CLLocationCoordinate2D(latitude: 55.75367, longitude: 37.620565)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: false)
    }
    
    private func moveToUserLocation() {
        var region = mapView.region
        region.center = mapView.userLocation.coordinate
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02
        mapView.setRegion(region, animated: true)
    }
    
}

extension MapController: MKMapViewDelegate {
    // MARK: - MKMapViewDelegate
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        guard needToMoveToUserLocation else { return }
        needToMoveToUserLocation = false
        moveToUserLocation()
    }
}

extension MapController: CLLocationManagerDelegate {
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedAlways || status == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }

}
