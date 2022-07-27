//
//  MockLocationsWeatherListService.swift
//  SngularTests
//
//  Created by Kristian Stefan Cortes Prieto on 27-07-22.
//

import Foundation

@testable import Sngular

final class MockLocationsWeatherListService: AnyLocationsWeatherListInteractor{
    var presenter: AnyLocationsWeatherListPresenter?
    var result: Result<LocationsWeatherListResponse?, Error> = .success(nil)

    func getLocationsWeatherList(latitude: Double, longitude: Double) {
        self.presenter?.interactorDidFetchLocationsWeatherList(with: result)
    }
}
