//
//  LocationWeatherListInteractor.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

class LocationsWeatherListInteractor: AnyLocationsWeatherListInteractor {
    var presenter: AnyLocationsWeatherListPresenter?
    
    func getLocationsWeatherList() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=35&lon=139&units=metric&appid=\(Constants.CONST_API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                self?.presenter?.interactorDidFetchLocationsWeatherList(with: .failure(FetchError.failed))
                return
            }
            do {
                var entities = try JSONDecoder().decode(LocationsWeatherListResponse.self, from: data)
                entities.filterByDays()
                self?.presenter?.interactorDidFetchLocationsWeatherList(with: .success(entities))
            }
            catch {
                self?.presenter?.interactorDidFetchLocationsWeatherList(with: .failure(error))
            }
        }
        task.resume()
    }
}
