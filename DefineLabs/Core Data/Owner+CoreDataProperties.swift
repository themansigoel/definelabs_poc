//
//  Owner+CoreDataProperties.swift
//  DefineLabs
//
//  Created by RAHUL GOEL on 11/10/20.
//  Copyright © 2020 -. All rights reserved.
//
//

import Foundation
import CoreData


extension Owner {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Owner> {
        return NSFetchRequest<Owner>(entityName: "Owner")
    }

    @NSManaged public var name: String?
    @NSManaged public var isOwner: Venue?

}
