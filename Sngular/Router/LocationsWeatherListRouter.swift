//
//  LocationWeatherListRouter.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

class LocationsWeatherListRouter: AnyLocationsWeatherListRouter {
    var entry: EntryPoint?
    
    static func start(latitude: Double, longitude: Double) -> AnyRouter {
        let router = LocationsWeatherListRouter()
        
        var view: AnyLocationsWeatherListView = LocationsWeatherListViewController()
        let presenter: LocationsWeatherListPresenter = LocationsWeatherListPresenter()
        let interactor: LocationsWeatherListInteractor = LocationsWeatherListInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.lalitude = latitude
        presenter.longitude = longitude
        presenter.router = router
        presenter.view = view
        presenter.interactor =  interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }

}
