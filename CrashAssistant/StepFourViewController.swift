//
//  StepFourViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class StepFourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    
    func setupButton() {
        
        sharePhotosButton.layer.borderWidth = 2
        sharePhotosButton.layer.borderColor = UIColor.black.cgColor
        sharePhotosButton.layer.masksToBounds = true
        sharePhotosButton.layer.cornerRadius = 5
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var accidentImageView: UIImageView!
    @IBOutlet weak var sharePhotosButton: UIButton!
    @IBAction func sharePhotosButtonTapped(_ sender: Any) {
    }
}
