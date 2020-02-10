//
//  EarthquakeViewModel.swift
//  EarthQuakeLookup
//
//  Created by Sarosh on 08.02.20.
//  Copyright © 2020 Sarosh. All rights reserved.
//

import Foundation
import UIKit

struct EarthquakeViewModel {
    
    let date: String
    
    let latitude: Double
    let longitude: Double
    
    let detailTextString: String    
    let accessoryType: UITableViewCell.AccessoryType
    
    init(earthquake: Earthquake) {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy"
        let date: Date? = dateFormatterGet.date(from: earthquake.datetime)

        self.date = dateFormatterPrint.string(from: date!)
        self.latitude = earthquake.lat
        self.longitude = earthquake.lng
        
        detailTextString = "Depth: \(earthquake.depth), Magnitude: \(earthquake.magnitude)"
        if earthquake.magnitude >= 8.0 {
            accessoryType = .detailDisclosureButton
        } else {
            accessoryType = .none
        }
        
    }    
    
}
