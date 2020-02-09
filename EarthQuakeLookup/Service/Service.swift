//
//  Service.swift
//  EarthQuakeLookup
//
//  Created by Sarosh on 08.02.20.
//  Copyright © 2020 Sarosh. All rights reserved.
//

import Foundation

class Service: NSObject {
    static let shared = Service()
    
    func fetchEarthquakes(completion: @escaping ([Earthquake]?, Error?) -> ()) {
        let urlString = "http://api.geonames.org/earthquakesJSON?formatted=true&north=44.1&south=-9.9&east=-22.4&west=55.2&username=mkoppelman"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch data:", err)
                return
            }
            guard let data = data else { return }
            do {
                let root = try JSONDecoder().decode(Root.self, from: data)                
                DispatchQueue.main.async {
                    completion(root.earthquakes, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
            }.resume()
    }
}
