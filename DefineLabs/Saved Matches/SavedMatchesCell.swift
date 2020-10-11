//
//  SavedMatchesCell.swift
//  DefineLabs
//
//  Created by RAHUL GOEL on 11/10/20.
//  Copyright © 2020 -. All rights reserved.
//

import Foundation
import UIKit

class SavedMatchesCell: UITableViewCell{
    
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var btnSavedMatches: UIButton!
    
    
    @IBAction func btnSavedPressed(_ sender: Any) {
    }
    
    func config(info: VenueInfoModel){
        
        lblCity.text = info.city
        lblState.text = info.state
        lblId.text = info.id
        btnSavedMatches.setImage(UIImage(named: "staricon"), for: .normal)
    }
    
    
}
