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
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StepFiveViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        witnessNameTextField.resignFirstResponder()
        witnessPhoneTextField.resignFirstResponder()
        witnessEmailTextField.resignFirstResponder()
        witness2NameTextField.resignFirstResponder()
        witness2PhoneTextField.resignFirstResponder()
        witness2EmailTextField.resignFirstResponder()
    }

    @IBOutlet weak var witnessNameTextField: UITextField!
    @IBOutlet weak var witnessPhoneTextField: UITextField!
    @IBOutlet weak var witnessEmailTextField: UITextField!
    @IBOutlet weak var witness2NameTextField: UITextField!
    @IBOutlet weak var witness2PhoneTextField: UITextField!
    @IBOutlet weak var witness2EmailTextField: UITextField!
}
