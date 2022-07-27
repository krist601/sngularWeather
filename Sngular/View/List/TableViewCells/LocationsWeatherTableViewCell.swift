//
//  LocationsWeatherTableViewCell.swift
//  Sngular
//
//  Created by Kristian Stefan Cortes Prieto on 27-07-22.
//

import UIKit

class LocationsWeatherTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: Outlets
    
    var collectionView: UICollectionView!
    var dateLabel: UILabel!
    
    //MARK: Global Variables
    
    var locationsWeatherListResponse: LocationsWeatherListResponse?
    var dayIndex: Int?
    
    //MARK: View Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func initView(locationsWeatherListResponse: LocationsWeatherListResponse?, dayIndex: Int){
        self.locationsWeatherListResponse = locationsWeatherListResponse
        self.dayIndex = dayIndex
        
        self.collectionView = viewWithTag(2) as? UICollectionView
        self.dateLabel = viewWithTag(1) as? UILabel
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let nib = UINib(nibName: "LocationsWeatherItemCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        self.dateLabel.text = self.locationsWeatherListResponse?.days?[dayIndex].date
        self.collectionView.reloadData()
    }
    
    //MARK: CollectionView Management
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.locationsWeatherListResponse?.days?[self.dayIndex!].list.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LocationsWeatherItemCollectionViewCell
        
        cell.loadData(time: self.locationsWeatherListResponse?.days?[self.dayIndex!].list[indexPath.row].dt_txt.getTime() ?? Constants.CONST_NO_DATA, temperature: self.locationsWeatherListResponse?.days?[self.dayIndex!].list[indexPath.row].main.temp.toString().toDegrees() ?? Constants.CONST_NO_DATA)
        
        return cell
    }
}
