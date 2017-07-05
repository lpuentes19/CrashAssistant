//
//  Profile+Convenience.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 7/5/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import Foundation
import CoreData

extension Profile {
    
    @discardableResult convenience init(name: String, address: String, email: String, phone: String, insurance: String, policyNumber: String, emergencyContacts: String? = nil, context: NSManagedObjectContext = CoreDataStack.context) {
    
        self.init(context: context)
    
        self.name = name
        self.address = address
        self.email = email
        self.phone = phone
        self.insurance = insurance
        self.policyNumber = policyNumber
        self.emergencyContacts = emergencyContacts
    }
}

 
