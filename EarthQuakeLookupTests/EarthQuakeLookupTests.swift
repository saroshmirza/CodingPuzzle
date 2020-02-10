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
        let earthQuake = Earthquake(datetime: "2011-03-11 04:46:23", depth: 1.0, lng: 10.0, src: "us", eqid: "bla", magnitude: 5, lat: 10.0)
        let earthQuakeViewModel = EarthquakeViewModel(earthquake: earthQuake)
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy"
        let date: Date? = dateFormatterGet.date(from: earthQuake.datetime)

        
        XCTAssertEqual(dateFormatterPrint.string(from: date!), earthQuakeViewModel.date)
        XCTAssertEqual(.none, earthQuakeViewModel.accessoryType)
    }
    
    func testEarthquakeViewModelMagnitudeOverThreshold(){
        let earthQuake = Earthquake(datetime: "2011-03-11 04:46:23", depth: 1.0, lng: 10.0, src: "us", eqid: "bla", magnitude: 10, lat: 10.0)
        let earthQuakeViewModel = EarthquakeViewModel(earthquake: earthQuake)
        
        XCTAssertEqual(.detailDisclosureButton, earthQuakeViewModel.accessoryType)
    }

}
