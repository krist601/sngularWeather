//
//  LocationWeatherListInteractor.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

class LocationsWeatherListInteractor: AnyLocationsWeatherListInteractor {
    var presenter: AnyLocationsWeatherListPresenter?
    
    func getLocationsWeatherList(latitude: Double, longitude: Double) {
        guard let url = URL(string: "\(Constants.CONST_BASE_URL)forecast?lat=\(latitude)&lon=\(longitude)&units=metric&appid=\(Constants.CONST_API_KEY)") else { return }
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
