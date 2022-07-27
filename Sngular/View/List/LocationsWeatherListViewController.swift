//
//  LocationsWeatherListViewController.swift
//  sngularTest
//
//  Created by Kristian Stefan Cortes Prieto on 26-07-22.
//

import UIKit

class LocationsWeatherListViewController: UIViewController, AnyLocationsWeatherListView, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var errorView: UIView!
    
    //MARK: Global Variables
    
    var presenter: AnyPresenter?
    var locationsWeatherListResponse: LocationsWeatherListResponse?
    
    //MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "LocationsWeatherTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "cell")
        
        self.title = "Sngular Weather"
    }
    
    //MARK: AnyLocationsWeatherListView Impementation
    
    func update(with locationsWeatherList: LocationsWeatherListResponse) {
        DispatchQueue.main.async {
            self.loadingView.isHidden = true
            self.errorView.isHidden = true
            self.locationsWeatherListResponse = locationsWeatherList
            self.tableView.reloadData()
        }
    }
    func update(with error: String) {
        DispatchQueue.main.async {
            self.loadingView.isHidden = true
            self.errorLabel.text = error
            self.errorView.isHidden = false
        }
    }
    
    //MARK: TableView Management
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LocationsWeatherTableViewCell
        cell.initView(locationsWeatherListResponse: locationsWeatherListResponse, dayIndex: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationsWeatherListResponse?.days?.count ?? 0
    }
}
