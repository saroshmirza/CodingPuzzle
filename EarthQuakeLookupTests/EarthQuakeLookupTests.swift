//
//  EarthQuakeLookupTests.swift
//  EarthQuakeLookupTests
//
//  Created by Sarosh on 09.02.20.
//  Copyright © 2020 Sarosh. All rights reserved.
//

import XCTest
@testable import EarthQuakeLookup

class EarthQuakeLookupTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEarthquakeViewModel(){
        let earthQuake = Earthquake(datetime: "", depth: 1.0, lng: 10.0, src: "us", eqid: "bla", magnitude: 5, lat: 10.0)
        let earthQuakeViewModel = EarthquakeViewModel(earthquake: earthQuake)
        
        XCTAssertEqual(earthQuake.eqid, earthQuakeViewModel.name)
        XCTAssertEqual(.none, earthQuakeViewModel.accessoryType)
    }
    
    func testEarthquakeViewModelMagnitudeOverThreshold(){
        let earthQuake = Earthquake(datetime: "", depth: 1.0, lng: 10.0, src: "us", eqid: "bla", magnitude: 10, lat: 10.0)
        let earthQuakeViewModel = EarthquakeViewModel(earthquake: earthQuake)
        
        XCTAssertEqual(.detailDisclosureButton, earthQuakeViewModel.accessoryType)
    }

}
