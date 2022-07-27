//
//  LocationWeatherListPresenter.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

class LocationsWeatherListPresenter: AnyLocationsWeatherListPresenter {
    
    var router: AnyRouter?
    var interactor: AnyLocationsWeatherListInteractor? {
        didSet {
            interactor?.getLocationsWeatherList()
        }
    }
    var view: AnyLocationsWeatherListView?
    
    init(){
        interactor?.getLocationsWeatherList()
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
