//
//  SideMenuCellInfo.swift
//  DefineLabs
//
//  Created by Mansi on 04/10/20.
//  Copyright © 2020 -. All rights reserved.
//

import Foundation


struct SideMenuCellInfo{
    
    var title : String
    var type : ScreenType
    
    init(title: String , screenType: ScreenType){
        self.title = title
        self.type = screenType
    }
    
}
