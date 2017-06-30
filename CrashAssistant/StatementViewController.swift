//
//  StatementViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class StatementViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StatementViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var statementTextView: UITextView!
}
