//
//  AnyRouter.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
}
protocol AnyLocationsWeatherListRouter: AnyRouter {
    static func start(latitude: Double, longitude: Double) -> AnyRouter
}
protocol AnyLocationsWeatherRouter: AnyRouter {
    static func start() -> AnyRouter
}
