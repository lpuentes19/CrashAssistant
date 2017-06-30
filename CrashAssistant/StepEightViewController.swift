//
//  StepEightViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class StepEightViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }

    func setupButtons() {
        callInsuranceButton.layer.borderWidth = 2
        callInsuranceButton.layer.borderColor = UIColor.black.cgColor
        callInsuranceButton.layer.masksToBounds = true
        callInsuranceButton.layer.cornerRadius = 5
    }
    @IBOutlet weak var callInsuranceButton: UIButton!
    @IBAction func callInsuranceButtonTapped(_ sender: Any) {
        
        guard let url = URL(string: "tel://3854450303") else { return }
        
        UIApplication.shared.open(url)
    }
}
