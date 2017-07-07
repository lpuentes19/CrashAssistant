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
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StepSevenViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBOutlet weak var officerNameTextField: UITextField!
    @IBOutlet weak var badgeNumberTextField: UITextField!
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        guard let officer = officerNameTextField.text,
            let badgeNumber = badgeNumberTextField.text else { return }
        
        AccidentReportsController.shared.update(officer: officer, badgeNumber: badgeNumber)
        
        performSegue(withIdentifier: "toStep8", sender: nil)
    }
}
