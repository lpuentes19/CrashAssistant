//
//  InitialViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/27/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (_) in
            self.fadeAnimation()
        }
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fadeAnimation()
    }
    
    func setupUI() {
        // Borders, rounded edges, adjusting text
        getStartedButton.layer.masksToBounds = true
        getStartedButton.layer.cornerRadius = 5
        getStartedButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        backgroundView.layer.masksToBounds = true
        backgroundView.layer.cornerRadius = 50
        
    }
    
    func fadeAnimation() {
        // Fade Animation
        getStartedButton.fadeOut()
        getStartedButton.fadeIn()
    }
}
