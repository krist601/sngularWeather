//
//  LocationWeatherListRouter.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

class LocationsWeatherListRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = LocationsWeatherListRouter()
        
        var view: AnyLocationsWeatherListView = LocationsWeatherListViewController()
        let presenter: LocationsWeatherListPresenter = LocationsWeatherListPresenter()
        let interactor: LocationsWeatherListInteractor = LocationsWeatherListInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor =  interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }

}
