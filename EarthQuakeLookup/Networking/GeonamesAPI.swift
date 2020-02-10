//
//  GeonamesAPI.swift
//  EarthQuakeLookup
//
//  Created by Sarosh on 10.02.20.
//  Copyright © 2020 Sarosh. All rights reserved.
//

import Foundation

class GeonamesAPI {
    var baseURL: String {
        return "http://api.geonames.org/"
    }
    
    var username: String {
        return "mkoppelman"
    }
    
    var interest: String {
        return "earthquakes"
    }
    
    var docType: String{
        return "JSON?"
    }
    
    var north: String{
        return "44.1"
    }
    var south: String{
        return "-9.9"
    }
    var east: String{
        return "-22.4"
    }
    var west: String{
        return "55.2"
    }
    
    func getUrl() -> String{
        let urlString = baseURL+interest+docType+"north="+north+"&south="+south+"&east="+east+"&west="+west+"&username="+username
        return urlString
    }
}
