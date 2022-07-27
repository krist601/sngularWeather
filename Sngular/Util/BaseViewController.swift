//
//  BaseViewController.swift
//  Sngular
//
//  Created by Kristian Stefan Cortes Prieto on 27-07-22.
//

import UIKit
import CoreLocation

class BaseViewController: UIViewController, CLLocationManagerDelegate {
    
    //MARK: Location Management
    
    func getLocation(){
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        
        let manager = CLLocationManager()
        
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        default:
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            self.presenter?.fetchData(latitude: latitude, longitude: longitude)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.update(with: "Something went wrong when we ask for your localization")
    }
}
