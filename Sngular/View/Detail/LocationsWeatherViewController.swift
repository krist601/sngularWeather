//
//  LocationsWeatherViewViewController.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

class LocationsWeatherViewController: UIViewController, AnyLocationsWeatherView {
    var presenter: AnyPresenter?
    var locationsWeather: LocationsWeatherResponse?
    
    @IBOutlet weak var locationsNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var macTempLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDegreesLabel: UILabel!
    @IBOutlet weak var windGustLabel: UILabel!
    
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var visibilityCloudsLabel: UILabel!
    
    @IBOutlet weak var windView: UIView!
    @IBOutlet weak var visibilityView: UIView!
    @IBOutlet weak var temperatureView: UIView!
    
    @IBOutlet weak var nextViewButton: UIButton!
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var errorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadViewComponents()
    }
    func loadViewComponents(){
        self.nextViewButton.layer.cornerRadius = self.nextViewButton.frame.height/2
        self.windView.layer.cornerRadius = Constants.CONST_CORNER_RADIOUS
        self.visibilityView.layer.cornerRadius = Constants.CONST_CORNER_RADIOUS
        self.temperatureView.layer.cornerRadius = Constants.CONST_CORNER_RADIOUS
        self.title = "Sngular Weather"
    }
    
    func update(with locationsWeather: LocationsWeatherResponse) {
        DispatchQueue.main.async {
            self.loadingView.isHidden = true
            self.errorView.isHidden = true
            self.locationsWeather = locationsWeather
            self.loadData()
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.loadingView.isHidden = true
            self.errorLabel.text = error
            self.errorView.isHidden = false
        }
    }
    
    func loadData(){
        self.feelsLikeLabel.text = self.locationsWeather?.main.feels_like.toString().toDegrees() ?? Constants.CONST_NO_DATA
        self.minTempLabel.text = self.locationsWeather?.main.temp_min.toString().toDegrees() ?? Constants.CONST_NO_DATA
        self.macTempLabel.text = self.locationsWeather?.main.temp_max.toString().toDegrees() ?? Constants.CONST_NO_DATA
        self.pressureLabel.text = self.locationsWeather?.main.pressure.toString().toPressure() ?? Constants.CONST_NO_DATA
        self.humidityLabel.text = self.locationsWeather?.main.humidity.toString().toPercent() ?? Constants.CONST_NO_DATA
        
        self.windSpeedLabel.text = self.locationsWeather?.wind.speed.toString().toKmH() ?? Constants.CONST_NO_DATA
        self.windDegreesLabel.text = self.locationsWeather?.wind.deg.toString().toDegrees() ?? Constants.CONST_NO_DATA
        self.windGustLabel.text = self.locationsWeather?.wind.gust.toString().toPercent() ?? Constants.CONST_NO_DATA
        
        self.visibilityLabel.text = self.locationsWeather?.visibility.toString().toVisibility() ?? Constants.CONST_NO_DATA
        self.visibilityCloudsLabel.text = self.locationsWeather?.clouds.all.toString().toPercent() ?? Constants.CONST_NO_DATA
        
    
        self.locationsNameLabel.text = self.locationsWeather?.name ?? Constants.CONST_NO_DATA
        self.currentTemperatureLabel.text = self.locationsWeather?.main.temp.toString().toDegrees() ?? Constants.CONST_NO_DATA
    }
    
    @IBAction func nextViewButtonPress(_ sender: Any) {
        let locationsWeatherListRouter = LocationsWeatherListRouter.start()
        let nextView = locationsWeatherListRouter.entry
        self.navigationController!.pushViewController(nextView!, animated: true)
    }
    
}
