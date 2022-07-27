//
//  LocationsWeatherInteractorTests.swift
//  SngularTests
//
//  Created by Kristian Stefan Cortes Prieto on 27-07-22.
//

import XCTest
@testable import Sngular

class LocationsWeatherInteractorTests: XCTestCase {
    var presenter: LocationsWeatherPresenter!
    var mock: MockLocationsWeatherService!

    override func setUp() {
        presenter = LocationsWeatherPresenter()
        mock = MockLocationsWeatherService()
        mock.presenter = presenter
        presenter.interactor = mock
    }
    func testSuccess(){
        mock.result = .success(nil)
        presenter.fetchData(latitude: 0.0, longitude: 0.0)
        XCTAssertTrue(presenter.isSuccess)
    }
    func testFailure(){
        mock.result = .failure(NSError(domain: "", code: -1))
        presenter.fetchData(latitude: 0.0, longitude: 0.0)
        XCTAssertNotNil(presenter.hasError)
    }
}
