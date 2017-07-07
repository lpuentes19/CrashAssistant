//
//  ProfileController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 7/5/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import Foundation
import CoreData

class ProfileController {
    
    static let shared = ProfileController()
    
    var profile: Profile? {
        return fetchProfile()
    }
    
    // Creating Profile
    func createProfileWith(name: String, address: String, email: String, phone: String, insurance: String, policyNumber: String) {
        
        let _ = Profile(name: name, address: address, email: email, phone: phone, insurance: insurance, policyNumber: policyNumber)
        
        saveToPersistentStorage()
    }
    
    // Updating Profile
    func update(name: String, address: String, email: String, phone: String, insurance: String, policyNumber: String) {
        guard let profile = profile else { return }
        profile.name = name
        profile.address = address
        profile.email = email
        profile.phone = phone
        profile.insurance = insurance
        profile.policyNumber = policyNumber
        
        saveToPersistentStorage()
    }
    
    // Loading Profile data
    func fetchProfile() -> Profile? {
        let request: NSFetchRequest<Profile> = Profile.fetchRequest()
        let profiles = (try? CoreDataStack.context.fetch(request)) ?? []
        return profiles.first
    }
    
    // Saving Profile data
    func saveToPersistentStorage() {
       // (try? CoreDataStack.context.save())
        let moc = CoreDataStack.context
        
        do {
            try moc.save()
        } catch {
            print("Error saving items to moc")
        }
    }
}
