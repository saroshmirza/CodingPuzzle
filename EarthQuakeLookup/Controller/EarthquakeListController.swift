//
//  EarthquakeListController.swift
//  EarthQuakeLookup
//
//  Created by Sarosh on 08.02.20.
//  Copyright © 2020 Sarosh. All rights reserved.
//

import UIKit

class EarthquakeListController: UITableViewController {
    
    private let service = Service()
    var earthquakeViewModels = [EarthquakeViewModel]()
    let cellId = "cellId"
    var indexSelected = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupTableView()
        fetchData()
    }
    
    fileprivate func fetchData() {
        service.fetchEarthquakes { (earthquakes, err) in
            if let err = err {
                print("Failed to fetch data:", err)
                return
            }
            
            self.earthquakeViewModels = earthquakes?.map({return EarthquakeViewModel(earthquake: $0)}) ?? []
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return earthquakeViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EarthquakeCell
        let earthquakeViewModel = earthquakeViewModels[indexPath.row]
        cell.earthquakeViewModel = earthquakeViewModel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelected = indexPath.row
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    fileprivate func setupTableView() {
        tableView.register(EarthquakeCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .mainTextBlue
        tableView.backgroundColor = UIColor.rgb(r: 12, g: 47, b: 57)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Earthquakes"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = UIColor.black
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail",
            let nextScene = segue.destination as? EarthquakeMapController{
            nextScene.viewModel = earthquakeViewModels[indexSelected]
            
        }
    }
    
}

class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension UIColor {
    static let mainTextBlue = UIColor.rgb(r: 7, g: 71, b: 89)
    static let highlightColor = UIColor.rgb(r: 50, g: 199, b: 242)
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
