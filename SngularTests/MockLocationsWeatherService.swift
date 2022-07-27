//
//  MockLocationsWeatherService.swift
//  SngularTests
//
//  Created by Kristian Stefan Cortes Prieto on 27-07-22.
//

import Foundation
@testable import Sngular

final class MockLocationsWeatherService: AnyLocationsWeatherInteractor{
    var presenter: AnyLocationsWeatherPresenter?
    var result: Result<LocationsWeatherResponse?, Error> = .success(nil)

    func getLocationsWeather(latitude: Double, longitude: Double) {
        self.presenter?.interactorDidFetchLocationsWeather(with: result)
    }
}

