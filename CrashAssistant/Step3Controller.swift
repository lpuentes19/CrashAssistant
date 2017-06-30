//
//  Step3Controller.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/30/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import Foundation
import CoreData

class Step3Controller {
    
    static let shared = Step3Controller()
    
    var accidentReports: [Step3] {
        
        let moc = CoreDataStack.context
        
        let request: NSFetchRequest<Step3> = Step3.fetchRequest()
        
        do {
            let people = try moc.fetch(request)
            return people
        } catch {
            print("Error fetching step 3 objects from Persistent Store")
            return []
        }
    }
    
    func addAccidentReportWith(name: String, address: String, phone: String, email: String, insurance: String, makeAndModel: String, color: String, licensePlate: String, date: Date = Date(), statement: String? = nil, officer: String? = nil, badgeNumber: String? = nil) {
        
        let _ = Step3(name: name, address: address, phone: phone, email: email, insurance: insurance, makeAndModel: makeAndModel, color: color, licensePlate: licensePlate, statement: statement, officer: officer, badgeNumber: badgeNumber)
        
        saveToPersistentStorage()
    }
    
    func updateStepWith(_ step3: Step3, statement: String) {
        step3.statement = statement
        
        saveToPersistentStorage()
    }
    
    func update(_ step3: Step3, officer: String, badgeNumber: String) {
        step3.officer = officer
        step3.badgeNumber = badgeNumber
        
        saveToPersistentStorage()
    }
    
    func delete(accidentReport: Step3) {
        let moc = CoreDataStack.context
        moc.delete(accidentReport)
    }
    
    func saveToPersistentStorage() {
        
        let moc = CoreDataStack.context
        
        do {
            try moc.save()
        } catch {
            print("Error saving items to moc")
        }
    }
}
