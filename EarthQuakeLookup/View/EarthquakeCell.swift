//
//  EarthquakeCell.swift
//  EarthQuakeLookup
//
//  Created by Sarosh on 08.02.20.
//  Copyright © 2020 Sarosh. All rights reserved.
//

import UIKit

class EarthquakeCell:UITableViewCell {
    
    var earthquakeViewModel: EarthquakeViewModel! {
        didSet {
            textLabel?.text = earthquakeViewModel.date
            detailTextLabel?.text = earthquakeViewModel.detailTextString
            accessoryType = earthquakeViewModel.accessoryType            
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        contentView.backgroundColor = isHighlighted ? .highlightColor : .white
        textLabel?.textColor = isHighlighted ? UIColor.white : .mainTextBlue
        detailTextLabel?.textColor = isHighlighted ? .white : .black
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
                
        textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel?.numberOfLines = 0
        detailTextLabel?.textColor = .black
        detailTextLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
