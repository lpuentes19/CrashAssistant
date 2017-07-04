//
//  WitnessesViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class WitnessesViewController: UIViewController {
    
    var accidentReport: Step3?
    var witnessName: String?
    var witnessEmail: String?
    var witnessPhone: String?
    var witness2Name: String?
    var witness2Email: String?
    var witness2Phone: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(WitnessesViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        witnessNameTextField.text = witnessName
        witnessEmailTextField.text = witnessEmail
        witnessPhoneTextField.text = witnessPhone
        witness2nameTextField.text = witness2Name
        witness2EmailTextField.text = witness2Email
        witness2PhoneTextField.text = witness2Phone
    }

    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBOutlet weak var witnessNameTextField: UITextField!
    @IBOutlet weak var witnessPhoneTextField: UITextField!
    @IBOutlet weak var witnessEmailTextField: UITextField!
    @IBOutlet weak var witness2nameTextField: UITextField!
    @IBOutlet weak var witness2PhoneTextField: UITextField!
    @IBOutlet weak var witness2EmailTextField: UITextField!
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let witnessName = witnessNameTextField.text,
            let witnessEmail = witnessEmailTextField.text,
            let witnessPhone = witnessPhoneTextField.text,
            let witness2Name = witness2nameTextField.text,
            let witness2Email = witness2EmailTextField.text,
            let witness2Phone = witness2PhoneTextField.text else { return }
        
        if let accidentReport = accidentReport {
            Step3Controller.shared.update(accidentReport: accidentReport, witnessName: witnessName, witnessEmail: witnessEmail, witnessPhone: witnessPhone, witness2Name: witness2Name, witness2Email: witness2Email, witness2Phone: witness2Phone)
        } else {
            Step3Controller.shared.addAccidentReportWith(witnessName: witnessName, witnessEmail: witnessEmail, witnessPhone: witnessPhone, witness2Name: witness2Name, witness2Email: witness2Email, witness2Phone: witness2Phone)
        }
    }
}
