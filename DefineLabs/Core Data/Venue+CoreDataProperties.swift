//
//  Venue+CoreDataProperties.swift
//  
//
//  Created by RAHUL GOEL on 10/10/20.
//
//

import Foundation
import CoreData


extension Venue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Venue> {
        return NSFetchRequest<Venue>(entityName: "Venue")
    }

    @NSManaged public var city: String?
    @NSManaged public var identity: String?
    @NSManaged public var state: String?
    @NSManaged public var isOwner: Owner?

}
