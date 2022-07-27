//
//  LocationWeatherInteractor.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

class LocationsWeatherInteractor: AnyLocationsWeatherInteractor {
    var presenter: AnyLocationsWeatherPresenter?
    
    func getLocationsWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&units=metric&appid=\(Constants.CONST_API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                self?.presenter?.interactorDidFetchLocationsWeather(with: .failure(FetchError.failed))
                return
            }
            do {
                let entities = try JSONDecoder().decode(LocationsWeatherResponse.self, from: data)
                self?.presenter?.interactorDidFetchLocationsWeather(with: .success(entities))
            }
            catch {
                self?.presenter?.interactorDidFetchLocationsWeather(with: .failure(error))
            }
        }
        task.resume()
    }
}
