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
        officerNameTextField.resignFirstResponder()
        badgeNumberTextField.resignFirstResponder()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStep8" {
            let destinationVC = segue.destination as? AccidentReportsTableViewController
            
            let accidentReports = Step3Controller.shared.accidentReports
            destinationVC?.accidentReports = accidentReports[0]
        }
    }
    
    @IBOutlet weak var officerNameTextField: UITextField!
    @IBOutlet weak var badgeNumberTextField: UITextField!
}
