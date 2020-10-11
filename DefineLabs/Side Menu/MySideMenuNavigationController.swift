//
//  MySideMenuNavigationController.swift
//  DefineLabs
//
//  Created by RAHUL GOEL on 04/10/20.
//  Copyright © 2020 -. All rights reserved.
//

import Foundation
import SideMenu

protocol MySideMenuNavigationControllerDelegate {
    func openScreen(screenType : ScreenType)
}
class MySideMenuNavigationController : SideMenuNavigationController{
    var navdelegate : MySideMenuNavigationControllerDelegate?
    
    class func newInstance()->MySideMenuNavigationController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "MySideMenuNavigationController") as! MySideMenuNavigationController
    }
  

    

}
