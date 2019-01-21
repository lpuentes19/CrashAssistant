//
//  FinishedStepsViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class FinishedStepsViewController: UIViewController {

    @IBOutlet weak var instructionsTextView: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        doneButton.layer.borderWidth = 1
        doneButton.layer.borderColor = UIColor.lightGray.cgColor
        doneButton.layer.masksToBounds = true
        doneButton.layer.cornerRadius = 5
        
        instructionsTextView.layer.borderWidth = 1
        instructionsTextView.layer.borderColor = UIColor.lightGray.cgColor
        instructionsTextView.layer.cornerRadius = 10
        instructionsTextView.layer.masksToBounds = true
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
