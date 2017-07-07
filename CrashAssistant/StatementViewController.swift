//
//  StatementViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class StatementViewController: UIViewController {

    var accidentReport: AccidentReports? {
        didSet {
            if isViewLoaded {
                updateStatement()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StatementViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        updateStatement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        statementTextView.setContentOffset(CGPoint.zero, animated: false)
    }

    func setupTextView() {
        statementTextView.layer.borderWidth = 1
        statementTextView.layer.borderColor = UIColor.black.cgColor
        statementTextView.layer.masksToBounds = true
        statementTextView.layer.cornerRadius = 5
    }
    
    func dismissKeyboard() {
        statementTextView.resignFirstResponder()
    }
    
    func updateStatement() {
        statementTextView.text = accidentReport?.statement
    }

    @IBOutlet weak var statementTextView: UITextView!
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let statement = statementTextView.text else { return }
        guard let accidentReport = accidentReport else { return }
        AccidentReportsController.shared.update(accident: accidentReport, statement: statement)
        
        let notificationController = UIAlertController(title: "Saved", message: "Your statement has been successfully saved.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        notificationController.addAction(okAction)
        
        self.present(notificationController, animated: true, completion: nil)
    }
}
