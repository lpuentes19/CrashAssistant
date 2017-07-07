//
//  EmergencyContacts+Convenience.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 7/6/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import Foundation
import CoreData

extension EmergencyContacts {
    
    @discardableResult convenience init(name: String, number: String, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        
        self.name = name
        self.number = number
    }
}

