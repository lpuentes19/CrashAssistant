//
//  StepThreeViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class StepThreeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StepThreeViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var insuranceTextField: UITextField!
    @IBOutlet weak var makeModelTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var licensePlateTextField: UITextField!
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        guard let name = nameTextField.text, !name.isEmpty,
            let address = addressTextField.text, !address.isEmpty,
            let phone = phoneTextField.text, !phone.isEmpty,
            let email = emailTextField.text, !email.isEmpty,
            let insurance = insuranceTextField.text, !insurance.isEmpty,
            let makeAndModel = makeModelTextField.text, !makeAndModel.isEmpty,
            let color = colorTextField.text, !color.isEmpty,
            let licensePlate = licensePlateTextField.text, !licensePlate.isEmpty else { return }
        
        Step3Controller.shared.addAccidentReportWith(name: name, address: address, phone: phone, email: email, insurance: insurance, makeAndModel: makeAndModel, color: color, licensePlate: licensePlate)
        
        performSegue(withIdentifier: "toStep4", sender: nil)
    }
}
