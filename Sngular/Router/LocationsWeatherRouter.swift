//
//  LocationWeatherRouter.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

class LocationsWeatherRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = LocationsWeatherRouter()
        
        var view: AnyLocationsWeatherView = LocationsWeatherViewController()
        let presenter: LocationsWeatherPresenter = LocationsWeatherPresenter()
        let interactor: LocationsWeatherInteractor = LocationsWeatherInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor =  interactor
        
        router.entry = view as? EntryPoint
        
        print(router.entry)
        
        return router
    }
}
