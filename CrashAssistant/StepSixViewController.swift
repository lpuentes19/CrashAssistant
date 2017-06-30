//
//  StepSixViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class StepSixViewController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        statementTextView.delegate = self
        
        //Tap Gesture to dismiss the keyboard for the user
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StepSixViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    func setupTextField() {
        statementTextView.layer.borderWidth = 1
        statementTextView.layer.borderColor = UIColor.black.cgColor
        statementTextView.layer.masksToBounds = true
        statementTextView.layer.cornerRadius = 5
        statementTextView.text = "Enter your statement here..."
        statementTextView.textColor = .lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if statementTextView.textColor == UIColor.lightGray {
            statementTextView.text = nil
            statementTextView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if statementTextView.text.isEmpty {
            statementTextView.text = "Enter your statement here..."
            statementTextView.textColor = UIColor.lightGray
        }
    }
    
    func dismissKeyboard() {
        statementTextView.resignFirstResponder()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStep7" {
            let destinationVC = segue.destination as? AccidentReportsTableViewController
            
            let accidentReports = Step3Controller.shared.accidentReports
            destinationVC?.accidentReports = accidentReports[0]
        }
    }

    @IBOutlet weak var statementTextView: UITextView!
}
