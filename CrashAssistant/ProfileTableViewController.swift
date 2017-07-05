//
//  ProfileTableViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController, UITextFieldDelegate {

    var profile: Profile? {
        didSet {
            updateProfile()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profile = ProfileController.shared.profile
        makeTextFieldsDelegates()
        updateProfile()
    }
    
    func makeTextFieldsDelegates() {
        nameTextField.delegate = self
        addressTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        insuranceTextField.delegate = self
        policyNumber.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func updateProfile() {

        guard let profile = profile, isViewLoaded else { return }
        
        nameTextField.text = profile.name
        addressTextField.text = profile.address
        emailTextField.text = profile.email
        phoneTextField.text = profile.phone
        insuranceTextField.text = profile.insurance
        policyNumber.text = profile.policyNumber
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var insuranceTextField: UITextField!
    @IBOutlet weak var policyNumber: UITextField!
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let name = nameTextField.text,
            let address = addressTextField.text,
            let email = emailTextField.text,
            let phone = phoneTextField.text,
            let insurance = insuranceTextField.text,
            let policyNumber = policyNumber.text else { return }
        
        if profile != nil {
            ProfileController.shared.update(name: name, address: address, email: email, phone: phone, insurance: insurance, policyNumber: policyNumber)
        } else {
            ProfileController.shared.createProfileWith(name: name, address: address, email: email, phone: phone, insurance: insurance, policyNumber: policyNumber)
        }
        performSegue(withIdentifier: "backToAccidentReports", sender: nil)
    }
}
