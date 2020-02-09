//
//  Earthquake.swift
//  EarthQuakeLookup
//
//  Created by Sarosh on 08.02.20.
//  Copyright © 2020 Sarosh. All rights reserved.
//

import Foundation

struct Earthquake: Codable {
    
    let datetime: String
    let depth: Float
    let lng: Double
    let src: String
    let eqid: String
    let magnitude: Float
    let lat: Double
}
