//
//  MatchesTableViewCell.swift
//  DefineLabs
//
//  Created by mansi on 29/09/20.
//  Copyright © 2020 -. All rights reserved.
//

import UIKit


protocol MatchesTableViewCellDelegate{
    func imageButtonSelected(cellType : ScreenType?)
}
class MatchesTableViewCell:UITableViewCell{
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnAll: UIButton!
    
    var delegate : MatchesTableViewCellDelegate?
    var cellType : ScreenType?

    @IBAction func btnImagePressed(_ sender: Any) {
        if let _ = delegate{
            self.delegate?.imageButtonSelected(cellType: cellType)
        }
    }

    func config(info: String, type : ScreenType){
        lblTitle.text = "\(info)"
    cellType  = type
        btnAll.setImage(UIImage(named: "star"), for: .normal)
    }
    
}
