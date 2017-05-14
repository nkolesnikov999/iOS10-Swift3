//
//  ItemType+CoreDataProperties.swift
//  DreamLister
//
//  Created by NK on 13.05.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType")
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
