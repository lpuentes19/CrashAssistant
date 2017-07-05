//
//  AccidentReportDetailTableViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class AccidentReportDetailTableViewController: UITableViewController, UITextFieldDelegate {
    
    var accidentReport: Step3? {
        didSet {
            updateDetailAccidentReport()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDetailAccidentReport()
        makeTextFieldsDelegates()
    }
    
    func makeTextFieldsDelegates() {
        nameTextField.delegate = self
        addressTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        insuranceTextField.delegate = self
        makeAndModelTextField.delegate = self
        licensePlateTextField.delegate = self
        colorTextField.delegate = self
        officerTextField.delegate = self
        badgeNumberTextField.delegate = self
    }
    
    func updateDetailAccidentReport() {
        guard let accidentReport = accidentReport, isViewLoaded else { return }
        
        nameTextField.text = accidentReport.name
        addressTextField.text = accidentReport.address
        phoneTextField.text = accidentReport.phone
        emailTextField.text = accidentReport.email
        insuranceTextField.text = accidentReport.insurance
        makeAndModelTextField.text = accidentReport.makeAndModel
        colorTextField.text = accidentReport.color
        licensePlateTextField.text = accidentReport.licensePlate
        officerTextField.text = accidentReport.officer
        badgeNumberTextField.text = accidentReport.badgeNumber
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWitnessVC" {
            guard let destinationVC = segue.destination as? WitnessesViewController else { return }
            destinationVC.accidentReport = accidentReport
        }
        
        if segue.identifier == "toStatementVC" {
            guard let destinationVC = segue.destination as? StatementViewController else { return }
            destinationVC.accidentReport = accidentReport
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var insuranceTextField: UITextField!
    @IBOutlet weak var makeAndModelTextField: UITextField!
    @IBOutlet weak var licensePlateTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var officerTextField: UITextField!
    @IBOutlet weak var badgeNumberTextField: UITextField!
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let name = nameTextField.text,
            let address = addressTextField.text,
            let phone = phoneTextField.text,
            let email = emailTextField.text,
            let insurance = insuranceTextField.text,
            let makeAndModel = makeAndModelTextField.text,
            let color = colorTextField.text,
            let licensePlate = licensePlateTextField.text,
            let officer = officerTextField.text,
            let badgeNumber = badgeNumberTextField.text else { return }
        
        if let accidentReport = accidentReport {
            Step3Controller.shared.update(accidentReport: accidentReport, name: name, address: address, phone: phone, email: email, insurance: insurance, makeAndModel: makeAndModel, color: color, licensePlate: licensePlate, officer: officer, badgeNumber: badgeNumber)
        } else {
            Step3Controller.shared.addAccidentReportWith(name: name, address: address, phone: phone, email: email, insurance: insurance, makeAndModel: makeAndModel, color: color, licensePlate: licensePlate, officer: officer, badgeNumber: badgeNumber)
        }
//        Step3Controller.shared.update(name: name, address: address, phone: phone, email: email, insurance: insurance, makeAndModel: makeAndModel, color: color, licensePlate: licensePlate)
//        Step3Controller.shared.update(officer: officer, badgeNumber: badgeNumber)
        
        performSegue(withIdentifier: "backToAccidentReport", sender: nil)
    }
}
