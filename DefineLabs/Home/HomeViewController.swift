//
//  HomeViewController.swift
//  DefineLabs
//
//  Created by mansi on 29/09/20.
//  Copyright © 2020 -. All rights reserved.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController{
  
    @IBOutlet weak var tblView: UITableView!
    var dataSource = [VenueInfoModel]()
    var leftMenuNav : MySideMenuNavigationController?
    
    override func viewDidLoad() {
           super.viewDidLoad()
    self.navigationItem.title = "All Matches"
           matchData()
            setupLefMenu()
       }
    @IBAction func btnLeftMenuPressed(_ sender: UIBarButtonItem) {
        if let lefMenuNav = leftMenuNav{
            present(lefMenuNav, animated: true, completion: nil)
        }
        
    }
    func setupLefMenu(){
        leftMenuNav = MySideMenuNavigationController.newInstance()
        leftMenuNav?.navdelegate = self
    }
    
    func matchData(){
        ApiManager.fetchMatchData{ [weak self] (data) in
            self?.dataSource = data
            DispatchQueue.main.async {
                self?.tblView.reloadData()
            }
        }
    }
    
}

extension HomeViewController :  UITableViewDelegate, UITableViewDataSource,AllMatchesTableViewCellDelegate{
    func saveVenuePressed(info:VenueInfoModel?) {
        CoreDataManager.shared.saveVenue(info: info)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return dataSource.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          if let cell = tableView.dequeueReusableCell(withIdentifier: "AllMatches", for: indexPath) as? AllMatchesTableViewCell{
            cell.delegate = self
              cell.config(info: dataSource[indexPath.row])
            
              return cell
          }
          return UITableViewCell()
      }
}
 

extension HomeViewController:MySideMenuNavigationControllerDelegate{
    func openScreen(screenType: ScreenType) {
        switch screenType {
        case .AllMatches:
            handleAllMatches()
            break
            
        case .SavedMatches:
            handleSavedMatches()
            break
            
        }
    }
    
    func handleAllMatches(){
        if !(self.navigationController?.topViewController is HomeViewController){
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func handleSavedMatches(){
        if !(self.navigationController?.topViewController is SavedMatchesViewController){
            self.navigationController?.popToRootViewController(animated: true)
            self.navigationController?.pushViewController(SavedMatchesViewController.newInstance(), animated: true)
        }
    }

}

