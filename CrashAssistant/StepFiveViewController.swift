//
//  StepFiveViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class StepFiveViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StepFiveViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setupUI() {
        instructionsTextView.layer.borderWidth = 1
        instructionsTextView.layer.borderColor = UIColor.lightGray.cgColor
        instructionsTextView.layer.cornerRadius = 10
        instructionsTextView.layer.masksToBounds = true
    }
    
    // Thinking about making this a tableview
    @IBOutlet weak var instructionsTextView: UITextView!
    @IBOutlet weak var witnessNameTextField: UITextField!
    @IBOutlet weak var witnessPhoneTextField: UITextField!
    @IBOutlet weak var witnessEmailTextField: UITextField!
    @IBOutlet weak var witness2NameTextField: UITextField!
    @IBOutlet weak var witness2PhoneTextField: UITextField!
    @IBOutlet weak var witness2EmailTextField: UITextField!
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        guard let witnessName = witnessNameTextField.text,
            let witnessEmail = witnessEmailTextField.text,
            let witnessPhone = witnessPhoneTextField.text,
            let witness2Name = witness2NameTextField.text,
            let witness2Email = witness2EmailTextField.text,
            let witness2Phone = witness2PhoneTextField.text else { return }
        
            AccidentReportsController.shared.update(witnessName: witnessName, witnessEmail: witnessEmail, witnessPhone: witnessPhone, witness2Name: witness2Name, witness2Email: witness2Email, witness2Phone: witness2Phone)
        
        performSegue(withIdentifier: "toStep6", sender: nil)
    }
}
