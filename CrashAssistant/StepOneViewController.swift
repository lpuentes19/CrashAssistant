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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
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
            guard let url = URL(string: "tel://911") else { return }
            if UIApplication.shared.canOpenURL(url) {
               UIApplication.shared.open(url)
            } else {
                let alertController = UIAlertController(title: "Phone not available", message: "You have not given permission to use your Phone or there is no Phone available to use", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(callAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
