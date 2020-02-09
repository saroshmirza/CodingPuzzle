//
//  EarthquakeMapController.swift
//  EarthQuakeLookup
//
//  Created by Sarosh on 09.02.20.
//  Copyright © 2020 Sarosh. All rights reserved.
//

import UIKit
import MapKit

class EarthquakeMapController: UIViewController {
    
    var viewModel: EarthquakeViewModel!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAnnotation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.mapView.removeAnnotations(self.mapView.annotations)
        
    }
    
    fileprivate func setupAnnotation() {
        let annotation = MKPointAnnotation()
        annotation.title = viewModel.name
        annotation.subtitle = viewModel.detailTextString
        let coordinate = CLLocationCoordinate2D(latitude: viewModel.latitude, longitude: viewModel.longitude)
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
        mapView.setRegion(region, animated: true)
    }
}
