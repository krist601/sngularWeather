//
//  LocationWeatherListPresenter.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

class LocationsWeatherListPresenter: AnyLocationsWeatherListPresenter {
    var lalitude: Double?
    var longitude: Double?
    var router: AnyRouter?
    var interactor: AnyLocationsWeatherListInteractor? {
        didSet {
            interactor?.getLocationsWeatherList(latitude: lalitude!, longitude: longitude!)
        }
    }
    var view: AnyLocationsWeatherListView?
    
    func fetchData(latitude: Double, longitude: Double){
        interactor?.getLocationsWeatherList(latitude: latitude, longitude: longitude)
    }

    func interactorDidFetchLocationsWeatherList(with result: Result<LocationsWeatherListResponse, Error>) {
        switch result {
        case .success(let locationsWeatherListResponse):
            view?.update(with: locationsWeatherListResponse)
        case .failure:
            view?.update(with: "something went wrong :(")
        }
    }
}
