//
//  StepSevenViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class StepSevenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StepSevenViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func setupUI() {
        instructionsTextView.layer.borderWidth = 1
        instructionsTextView.layer.borderColor = UIColor.lightGray.cgColor
        instructionsTextView.layer.cornerRadius = 10
        instructionsTextView.layer.masksToBounds = true
    }

    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBOutlet weak var instructionsTextView: UITextView!
    @IBOutlet weak var officerNameTextField: UITextField!
    @IBOutlet weak var badgeNumberTextField: UITextField!
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        guard let officer = officerNameTextField.text,
            let badgeNumber = badgeNumberTextField.text else { return }
        
        AccidentReportsController.shared.update(officer: officer, badgeNumber: badgeNumber)
        
        performSegue(withIdentifier: "toStep8", sender: nil)
    }
}
