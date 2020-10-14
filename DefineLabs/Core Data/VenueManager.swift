//
//  VenueManager.swift
//  DefineLabs
//
//  Created by Mansi on 10/10/20.
//  Copyright © 2020 -. All rights reserved.
//

import CoreData
import Foundation

extension CoreDataManager{
    func saveVenue(info:VenueInfoModel?){
        let venue = NSEntityDescription.insertNewObject(forEntityName: "Venue", into: privateContext) as? Venue
        venue?.city = info?.city
        venue?.state = info?.state
        venue?.identity = info?.id
        saveContext()
    print(documentDirectoryPath())
        
    }
    
    func fetchVenue(completionHandler: @escaping([VenueInfoModel])->Void){
        do{
            let result = try privateContext.fetch(Venue.fetchRequest())
            var venueDictionary : [[String:Any]] = [[String:Any]]()
            for data in result {
                if let venue = data as? Venue{
                    if  let dict = venue.getPropertyDictionary(){
                    venueDictionary.append(dict)
                    }
                }
            }
            
            var venueInfo = [VenueInfoModel]()
            for venue in venueDictionary{
                if let city = venue["city"] as? String, let state = venue["state"] as? String , let id = venue["identity"] as? String{
                    let obj = VenueInfoModel(city: city, state: state, id: id)
                    venueInfo.append(obj)
                }
            }
            completionHandler(venueInfo)
        }catch{
            print("Error COde goes here")
        }
}

}
