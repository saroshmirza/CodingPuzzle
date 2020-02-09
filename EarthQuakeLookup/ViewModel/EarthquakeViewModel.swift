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
    
    let name: String
    
    let latitude: Double
    let longitude: Double
    
    let detailTextString: String    
    let accessoryType: UITableViewCell.AccessoryType
    
    init(earthquake: Earthquake) {
        self.name = earthquake.eqid
        
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
