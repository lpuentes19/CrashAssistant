//
//  StatementViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class StatementViewController: UIViewController {

    var statement: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StatementViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        statementTextView.text = statement
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

    @IBOutlet weak var statementTextView: UITextView!
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
}
