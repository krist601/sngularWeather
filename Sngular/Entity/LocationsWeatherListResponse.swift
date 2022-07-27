//
//  LocationWheaterListResponse.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

struct LocationsWeatherListResponse: Codable{
    var city: CityEntity
    var cod: String
    var message: Double
    var cnt: Int
    var list: [TimeWeatherEntity]
    var days: [DaysEntity]?

    struct DaysEntity: Codable{
        var date: String
        var list: [TimeWeatherEntity]
    }
    struct CityEntity: Codable{
        var id: Int
        var name: String
        var coord: CoordEntity
        var country: String
        var population: Int
        var timezone: Int
        var sunrise: Int
        var sunset: Int
        
        struct CoordEntity: Codable{
            var lon: Double
            var lat: Double
        }
    }
    struct TimeWeatherEntity: Codable{
        var dt: Int
        var main: MainEntity
        var weather: [WeatherEntity]
        var clouds: CloudsEntity
        var wind: WindEntity
        var visibility: Int
        var pop: Double
        var sys: SysEntity
        var dt_txt: String
        
        struct MainEntity: Codable{
            var temp: Double
            var feels_like: Double
            var temp_min: Double
            var temp_max: Double
            var pressure: Int
            var sea_level: Int
            var grnd_level: Int
            var humidity: Int
            var temp_kf: Double
        }
        struct WeatherEntity: Codable{
            var id: Int
            var main: String
            var description: String
            var icon: String
        }
        struct CloudsEntity: Codable{
            var all: Int
        }
        struct WindEntity: Codable{
            var speed: Double
            var deg: Int
            var gust: Double
        }
        struct SysEntity: Codable{
            var pod: String
        }
    }
    
    mutating func filterByDays(){
        var date = ""
        self.days = []
        var newList = [TimeWeatherEntity]()
        list.forEach { item in
            if(date == item.dt_txt.getDate()){
                newList.append(item)
            }else{
                if(date != ""){
                    self.days?.append(DaysEntity(date: date, list:  newList))
                    newList = [TimeWeatherEntity]()
                }
                date = item.dt_txt.getDate()
                newList.append(item)
            }
        }
        self.days?.append(DaysEntity(date: date, list:  newList))
    }
}
