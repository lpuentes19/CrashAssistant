//
//  StepSixViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class StepSixViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }

    func setupTextField() {
        
        statementTextView.text = "Enter your statement here..."
        statementTextView.textColor = .lightGray
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
