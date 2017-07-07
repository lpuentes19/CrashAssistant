//
//  EmergencyContactsController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 7/6/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import Foundation
import CoreData

class EmergencyContactsController {
    
    static let shared = EmergencyContactsController()
    
    var emergencyContacts: [EmergencyContacts] {
        return fetchEmergencyContacts()
    }
    
    // Add Emergency Contact
    func addEmergencyContact(name: String, number: String) {
        
        let _ = EmergencyContacts(name: name, number: number)
        
        saveToPersistentStorage()
    }
    
    // Delete Emergency Contact
    func delete(emergencyContact: EmergencyContacts) {
        let moc = CoreDataStack.context
        moc.delete(emergencyContact)
        
        saveToPersistentStorage()
    }
    
    // Save Emergency Contact
    func saveToPersistentStorage() {
        (try? CoreDataStack.context.save())
    }
    
    // Load Emergency Contact
    func fetchEmergencyContacts() -> [EmergencyContacts] {
        let request: NSFetchRequest<EmergencyContacts> = EmergencyContacts.fetchRequest()
        return(try? CoreDataStack.context.fetch(request)) ?? []
    }
}
