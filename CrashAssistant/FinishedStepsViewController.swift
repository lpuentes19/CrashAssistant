//
//  FinishedStepsViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class FinishedStepsViewController: UIViewController {

    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }

    func setupButtons() {
        doneButton.layer.borderWidth = 2
        doneButton.layer.borderColor = UIColor.black.cgColor
        doneButton.layer.masksToBounds = true
        doneButton.layer.cornerRadius = 5
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
