//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by NK on 13.05.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
    }
    
}
