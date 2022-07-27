//
//  LocationWeatherResponse.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

struct LocationsWeatherResponse: Codable {
    var coord: CoordEntity
    var weather: [WeatherEntity]
    var base: String
    var main: MainEntity
    var visibility: Int
    var wind: WindEntity
    var clouds: CloudsEntity
    var dt: Int
    var sys: SysEntity
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
    
    struct CoordEntity: Codable{
        var lon: Double
        var lat: Double
    }
    struct WeatherEntity: Codable{
        var id: Int
        var main: String
        var description: String
        var icon: String
    }
    struct MainEntity: Codable{
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Int
        var humidity: Int
    }
    struct WindEntity: Codable{
        var speed: Double
        var deg: Int
        var gust: Double?
    }
    struct CloudsEntity: Codable{
        var all: Int
    }
    struct SysEntity: Codable{
        var type: Int
        var id: Int
        var country: String
        var sunrise: Int
        var sunset: Int
    }
}
