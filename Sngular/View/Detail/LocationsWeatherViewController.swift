//
//  LocationsWeatherViewViewController.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

class LocationsWeatherViewController: AnyLocationsWeatherView {
    var presenter: AnyPresenter?
    var locationsWeather: LocationsWeatherResponse?
    
    func fetchData(){
        
    }
    
    func update(with locationsWeather: LocationsWeatherResponse) {
        //DispatchQueue.main.async{
            //self.locationsWeather = locationsWeather
            //load data into view
        //}
    }
    
    func update(with error: String) {
        
    }
}
