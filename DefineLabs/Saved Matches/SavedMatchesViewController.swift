//
//  SavedMatchesViewController.swift
//  DefineLabs
//
//  Created by Mansi on 04/10/20.
//  Copyright © 2020 -. All rights reserved.
//

import UIKit

class SavedMatchesViewController: UIViewController {
    
    
    @IBOutlet weak var tblView: UITableView!
    var dataSource = [VenueInfoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Saved Matches"
        savedData() 
    }
    class func newInstance()->SavedMatchesViewController{
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           return storyboard.instantiateViewController(identifier: "SavedMatchesViewController") as! SavedMatchesViewController
       }
    func savedData(){
        CoreDataManager.shared.fetchVenue{ [weak self] (data) in
            self?.dataSource = data
            DispatchQueue.main.async {
                self?.tblView.reloadData()
            }
        }
    }


}

extension SavedMatchesViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SavedMatchesCell", for: indexPath) as? SavedMatchesCell{
        
                cell.config(info: dataSource[indexPath.row])
              
                return cell
            }
            return UITableViewCell()
        }
    }
    
    

