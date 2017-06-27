//
//  InitialViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/27/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        fadeAnimation()
    }
    
    func setupButtons() {
        // Borders, rounded edges, adjusting text
        getStartedButton.layer.masksToBounds = true
        getStartedButton.layer.cornerRadius = 5
        getStartedButton.titleLabel?.adjustsFontSizeToFitWidth = true
        getStartedButton.layer.borderWidth = 2
        getStartedButton.layer.borderColor = UIColor.black.cgColor
        
        profileButton.layer.masksToBounds = true
        profileButton.layer.cornerRadius = 5
        profileButton.titleLabel?.adjustsFontSizeToFitWidth = true
        profileButton.layer.borderWidth = 2
        profileButton.layer.borderColor = UIColor.black.cgColor
    }
    
    func fadeAnimation() {
        // Fade Animation
        getStartedButton.fadeOut()
        getStartedButton.fadeIn()
        profileButton.fadeOut()
        profileButton.fadeIn()
        carCrashImage.fadeOut()
        carCrashImage.fadeIn()
        folderImage.fadeOut()
        folderImage.fadeIn()
        accidentTextView.fadeOut()
        accidentTextView.fadeIn()
        profileTextView.fadeOut()
        profileTextView.fadeIn()
        titleLabel.fadeOut()
        titleLabel.fadeIn()
    }
    
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var carCrashImage: UIImageView!
    @IBOutlet weak var folderImage: UIImageView!
    @IBOutlet weak var accidentTextView: UITextView!
    @IBOutlet weak var profileTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
}
