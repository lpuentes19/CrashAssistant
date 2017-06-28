//
//  WitnessesViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class WitnessesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var witnessNameTextField: UITextField!
    @IBOutlet weak var witnessPhoneTextField: UITextField!
    @IBOutlet weak var witnessEmailTextField: UITextField!
    @IBOutlet weak var witness2nameTextField: UITextField!
    @IBOutlet weak var witness2PhoneTextField: UITextField!
    @IBOutlet weak var witness2EmailTextField: UITextField!
}
