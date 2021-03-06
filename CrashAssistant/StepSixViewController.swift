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
        setupUI()
        statementTextView.delegate = self
        setupUI()
        //Tap Gesture to dismiss the keyboard for the user
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StepSixViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    func setupUI() {
        statementTextView.layer.borderWidth = 1
        statementTextView.layer.borderColor = UIColor.lightGray.cgColor
        statementTextView.layer.masksToBounds = true
        statementTextView.layer.cornerRadius = 5
        statementTextView.text = "Enter your statement here..."
        statementTextView.textColor = .lightGray
        
        instructionsTextView.layer.borderWidth = 1
        instructionsTextView.layer.borderColor = UIColor.lightGray.cgColor
        instructionsTextView.layer.cornerRadius = 10
        instructionsTextView.layer.masksToBounds = true
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

    @IBOutlet weak var instructionsTextView: UITextView!
    @IBOutlet weak var statementTextView: UITextView!
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        guard let statement = statementTextView.text, !statement.isEmpty else { return }
        
        AccidentReportsController.shared.update(statement: statement)
        
        performSegue(withIdentifier: "toStep7", sender: nil)
    }
}
