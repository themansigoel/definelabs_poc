//
//  VenueInfoModel.swift
//  DefineLabs
//
//  Created by Mansi on 30/09/20.
//  Copyright © 2020 -. All rights reserved.
//

import Foundation
class VenueInfoModel{
    var city : String
    var state : String
    var id : String
    
    init(city:String, state:String, id:String){
        self.city = city
        self.state = state
        self.id = id
        
    }
}
