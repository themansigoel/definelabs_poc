//
//  AllMatchesTableViewCell.swift
//  DefineLabs
//
//  Created by Mansi on 01/10/20.
//  Copyright © 2020 -. All rights reserved.
//

import UIKit

protocol  AllMatchesTableViewCellDelegate {
    func  saveVenuePressed(info:VenueInfoModel?)
}
class AllMatchesTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var btnSavedVenue: UIButton!
    var venue:VenueInfoModel?
    
    var delegate : AllMatchesTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func btnSavedPressed(_ sender: Any) {
        if let _ = delegate{
            self.delegate?.saveVenuePressed(info: venue)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(info: VenueInfoModel){
        venue = info
        lblCity.text = info.city
        lblState.text = info.state
        lblId.text = info.id
        btnSavedVenue.setImage(UIImage(named: "staricon"), for: .normal)
    }

}
