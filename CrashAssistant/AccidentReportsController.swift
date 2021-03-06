//
//  Step3Controller.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/30/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import Foundation
import CoreData

class AccidentReportsController {
    
    static let shared = AccidentReportsController()
    
    var step3: AccidentReports?
    var accidentReports: [AccidentReports] {
        return fetchAccidentReports()
    }
    
    func addAccidentReportWith(name: String, address: String, phone: String, email: String, insurance: String, makeAndModel: String, color: String, licensePlate: String, date: Date = Date(), statement: String? = nil, officer: String? = nil, badgeNumber: String? = nil, witnessName: String? = nil, witnessEmail: String? = nil, witnessPhone: String? = nil, witness2Name: String? = nil, witness2Email: String? = nil, witness2Phone: String? = nil) {
        
         step3 = AccidentReports(name: name, address: address, phone: phone, email: email, insurance: insurance, makeAndModel: makeAndModel, color: color, licensePlate: licensePlate, statement: statement, officer: officer, badgeNumber: badgeNumber, witnessName: witnessName, witnessEmail: witnessEmail, witnessPhone: witnessPhone, witness2Name: witness2Name, witness2Email: witness2Name, witness2Phone: witnessPhone)
        
        saveToPersistentStorage()
    }
    // This func is used to edit and save info on the detail Accident Reports VC
    func addAccidentReportWith(name: String, address: String, phone: String, email: String, insurance: String, makeAndModel: String, color: String, licensePlate: String, officer: String, badgeNumber: String) {
        
        step3 = AccidentReports(name: name, address: address, phone: phone, email: email, insurance: insurance, makeAndModel: makeAndModel, color: color, licensePlate: licensePlate, officer: officer, badgeNumber: badgeNumber)
        
        saveToPersistentStorage()
    }
    
    // This func is used to edit info on the detail Accident Reports VC
    func update(accidentReport: AccidentReports, name: String, address: String, phone: String, email: String, insurance: String, makeAndModel: String, color: String, licensePlate: String, officer: String, badgeNumber: String) {
        accidentReport.name = name
        accidentReport.address = address
        accidentReport.phone = phone
        accidentReport.email = email
        accidentReport.insurance = insurance
        accidentReport.makeAndModel = makeAndModel
        accidentReport.color = color
        accidentReport.licensePlate = licensePlate
        accidentReport.officer = officer
        accidentReport.badgeNumber = badgeNumber
        
        saveToPersistentStorage()
    }
    
    func update(accident: AccidentReports, statement: String) {
        
        accident.statement = statement
        
        saveToPersistentStorage()
    }
    
    func update(statement: String) {
        
        step3?.statement = statement
        
        saveToPersistentStorage()
    }
    
    func update(officer: String, badgeNumber: String) {
        step3?.officer = officer
        step3?.badgeNumber = badgeNumber
        
        saveToPersistentStorage()
    }
    
    func update(witnessName: String, witnessEmail: String, witnessPhone: String, witness2Name: String, witness2Email: String, witness2Phone: String) {
        step3?.witnessName = witnessName
        step3?.witnessEmail = witnessEmail
        step3?.witnessPhone = witnessPhone
        step3?.witness2Name = witness2Name
        step3?.witness2Email = witness2Email
        step3?.witness2Phone = witness2Phone
        
        saveToPersistentStorage()
    }
    // This func is used to edit and save info on the Witness VC
    func update(accidentReport: AccidentReports, witnessName: String, witnessEmail: String, witnessPhone: String, witness2Name: String, witness2Email: String, witness2Phone: String) {
        
        accidentReport.witnessName = witnessName
        accidentReport.witnessEmail = witnessEmail
        accidentReport.witnessPhone = witnessPhone
        accidentReport.witness2Name = witness2Name
        accidentReport.witness2Email = witness2Email
        accidentReport.witness2Phone = witness2Phone
        
        saveToPersistentStorage()
    }
    
    func delete(accidentReport: AccidentReports) {
        let moc = CoreDataStack.context
        moc.delete(accidentReport)
        
        saveToPersistentStorage()
    }
    
    func fetchAccidentReports() -> [AccidentReports] {
        let request: NSFetchRequest<AccidentReports> = AccidentReports.fetchRequest()
        return(try? CoreDataStack.context.fetch(request)) ?? []
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
