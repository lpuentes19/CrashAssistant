//
//  StepOneViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class StepOneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    func setupButtons() {
        call911Button.layer.borderWidth = 2
        call911Button.layer.borderColor = UIColor.black.cgColor
        call911Button.layer.masksToBounds = true
        call911Button.layer.cornerRadius = 5
    }
    
    @IBOutlet weak var call911Button: UIButton!
    @IBAction func call911ButtonTapped(_ sender: Any) {
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
    }
}
