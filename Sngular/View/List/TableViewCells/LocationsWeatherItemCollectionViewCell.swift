//
//  LocationsWeatherItemCollectionViewCell.swift
//  Sngular
//
//  Created by Kristian Stefan Cortes Prieto on 27-07-22.
//

import UIKit

class LocationsWeatherItemCollectionViewCell: UICollectionViewCell {
    
    //MARK: View Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func loadData(time: String, temperature: String){
        let timeLabel = viewWithTag(1) as? UILabel
        let temperatureLabel = viewWithTag(2) as? UILabel
        
        timeLabel?.text = time
        temperatureLabel?.text = temperature
    }
}
