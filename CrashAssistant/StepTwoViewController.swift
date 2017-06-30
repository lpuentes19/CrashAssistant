//
//  StepTwoViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class StepTwoViewController: UIViewController {

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
        
        let alertController = UIAlertController(title: "Emergency Call", message: "Are you sure you wish to dial 911?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let callAction = UIAlertAction(title: "Call", style: .default) { (_) in
            guard let url = URL(string: "tel://3854450303") else { return }
            
            UIApplication.shared.open(url)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(callAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
