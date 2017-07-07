//
//  WitnessesViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class WitnessesViewController: UIViewController {
    
    var accidentReport: AccidentReports? {
        didSet {
            if isViewLoaded {
                updateWitnesses()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(WitnessesViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        updateWitnesses()
    }
    
    func updateWitnesses() {
        witnessNameTextField.text = accidentReport?.witnessName
        witnessEmailTextField.text = accidentReport?.witnessEmail
        witnessPhoneTextField.text = accidentReport?.witnessPhone
        witness2nameTextField.text = accidentReport?.witness2Name
        witness2EmailTextField.text = accidentReport?.witness2Email
        witness2PhoneTextField.text = accidentReport?.witness2Phone
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

        guard let accidentReport = accidentReport else { return }
        AccidentReportsController.shared.update(accidentReport: accidentReport, witnessName: witnessName, witnessEmail: witnessEmail, witnessPhone: witnessPhone, witness2Name: witness2Name, witness2Email: witness2Email, witness2Phone: witness2Phone)
        
        let notificationController = UIAlertController(title: "Saved", message: "Your witnesses have been successfully saved.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        notificationController.addAction(okAction)
        
        self.present(notificationController, animated: true, completion: nil)
    }
}
