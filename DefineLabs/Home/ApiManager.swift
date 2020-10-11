//
//  ApiManager.swift
//  DefineLabs
//
//  Created by RAHUL GOEL on 30/09/20.
//  Copyright © 2020 -. All rights reserved.
//

import Foundation

class ApiManager{
    
    class func fetchMatchData(handler: @escaping([VenueInfoModel]) -> Void){
        let matchUrl = "https://api.foursquare.com/v2/venues/search?ll=40.7484,-73.9857&oauth_token=NPKYZ3WZ1VYMNAZ2FLX1WLECAWSMUVOQZOIDBN53F3LVZBPQ&v=20180616"
        if let url = URL(string: matchUrl){
            
            let session:URLSession = URLSession(configuration: .default)
            
            let task = session.dataTask(with:url, completionHandler:{
                (data,response,error) in
                if error != nil{
                    print(error!)
                }
                
                if let data = data{
                    let jsonResponse = try? JSONSerialization.jsonObject(with:data, options: [])
                    if let json = jsonResponse{
                        if let dict = json as? [String : Any]{
                            if let response = dict["response"] as? [String :Any],let venues = response["venues"] as?  [[String :Any]]{
                                var arr : [VenueInfoModel] = [VenueInfoModel]()
                                for venue in venues{
                                    
                                    if let location = venue["location"] as? [String: Any],let id = venue["id"] as? String{
                                        if let city = location["city"] as? String, let state = location["state"] as? String
                                        {
                                            let obj = VenueInfoModel(city: city, state: state, id: id)
                                            arr.append(obj)
                                        }
                                    }
                                }
                                handler(arr)
                                
                            }
                        }
                        
                    }
                }
                
            })
            task.resume()
            
        }
    }
}
