//
//  Step3+Convenience.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/30/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import Foundation
import CoreData

extension Step3 {

    @discardableResult convenience init(name: String, address: String, phone: String, email: String, insurance: String, makeAndModel: String, color: String, licensePlate: String, date: Date = Date(), statement: String? = nil, officer: String? = nil, badgeNumber: String? = nil, witnessName: String? = nil, witnessEmail: String? = nil, witnessPhone: String? = nil, witness2Name: String? = nil, witness2Email: String? = nil, witness2Phone: String? = nil, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        
        self.name = name
        self.address = address
        self.phone = phone
        self.email = email
        self.insurance = insurance
        self.makeAndModel = makeAndModel
        self.color = color
        self.licensePlate = licensePlate
        self.date = date as NSDate
        self.statement = statement
        self.officer = officer
        self.badgeNumber = badgeNumber
        self.witnessName = witnessName
        self.witnessEmail = witnessEmail
        self.witnessPhone = witnessPhone
        self.witness2Name = witness2Name
        self.witness2Email = witness2Email
        self.witness2Phone = witness2Phone
    }
    
    
}
