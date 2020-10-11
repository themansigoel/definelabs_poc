//
//  ViewController.swift
//  DefineLabs
//
//  Created by mansi on 29/09/20.
//  Copyright © 2020 -. All rights reserved.
//

import UIKit
import SideMenu

class MySideMenuViewController : UIViewController ,UITableViewDelegate,UITableViewDataSource,MatchesTableViewCellDelegate{
    
        
    @IBOutlet weak var tblView: UITableView!
    
    var dataSource:[SideMenuCellInfo] = [SideMenuCellInfo(title: "ALL Matches", screenType: .AllMatches),SideMenuCellInfo(title: "Saved Matches", screenType: .SavedMatches)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MatchesTableViewCell" ) as? MatchesTableViewCell{
            cell.delegate = self
            cell.config(info: dataSource[indexPath.row].title, type: dataSource[indexPath.row].type)
            
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        imageButtonSelected(cellType: dataSource[indexPath.row].type)
        
    }
    
    class func newInstance()->MySideMenuViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "MySideMenuViewController") as! MySideMenuViewController
    }
    
    func imageButtonSelected(cellType: ScreenType?) {
         dismiss(animated: true, completion: nil)
        if let nav = self.navigationController as? MySideMenuNavigationController, let cellType = cellType{
            nav.navdelegate?.openScreen(screenType: cellType)
        }
       
    }
    
}

extension MySideMenuViewController{
    func openAllMatches(){
        
    }
}

