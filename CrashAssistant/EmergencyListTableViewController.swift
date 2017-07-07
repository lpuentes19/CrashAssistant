//
//  EmergencyListTableViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit
import ContactsUI

class EmergencyListTableViewController: UITableViewController, CNContactPickerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EmergencyContactsController.shared.emergencyContacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmergencyListCell", for: indexPath)
        
        let emergencyContact = EmergencyContactsController.shared.emergencyContacts[indexPath.row]
        
        cell.textLabel?.text = emergencyContact.name
        cell.detailTextLabel?.text = emergencyContact.number
        
        return cell
    }
 
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let emergencyContact = EmergencyContactsController.shared.emergencyContacts[indexPath.row]
            EmergencyContactsController.shared.delete(emergencyContact: emergencyContact)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Contact Picker Method(s)
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        let mobileNumber = (contact.phoneNumbers.first?.value)!.stringValue
        let contactName = "\(contact.givenName)"
        
        EmergencyContactsController.shared.addEmergencyContact(name: contactName, number: mobileNumber)
        tableView.reloadData()
    }

    @IBAction func addEmergencyContactButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Emergency Contact", message: "Would you like to create or add an existing contact?", preferredStyle: .actionSheet)

        let addContact = UIAlertAction(title: "Create Contact", style: .default) { (_) in
            
            let addContactAlertController = UIAlertController(title: "Add Contact", message: "Please enter name and number.", preferredStyle: .alert)
            
            var contactTextField: UITextField?
            var contact2TextField: UITextField?
            
            addContactAlertController.addTextField(configurationHandler: { (nameTextField) in
                contactTextField = nameTextField
                nameTextField.placeholder = "Please enter name..."
            })
            addContactAlertController.addTextField(configurationHandler: { (phoneNumberTextField) in
                contact2TextField = phoneNumberTextField
                phoneNumberTextField.placeholder = "Please enter phone number..."
            })
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (_) in
                
                guard let name = contactTextField?.text,
                    let number = contact2TextField?.text else { return }
                EmergencyContactsController.shared.addEmergencyContact(name: name, number: number)
                self.tableView.reloadData()
            })
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            addContactAlertController.addAction(okAction)
            addContactAlertController.addAction(cancelAction)
            
            self.present(addContactAlertController, animated: true, completion: nil)
        }
        
        let addExistingContact = UIAlertAction(title: "Add Existing Contact", style: .default) { (_) in
            let contactPicker = CNContactPickerViewController()
            contactPicker.delegate = self
            contactPicker.displayedPropertyKeys =
                [CNContactGivenNameKey, CNContactPhoneNumbersKey]
            self.present(contactPicker, animated: true, completion: nil)
        }
        
        alertController.addAction(addContact)
        alertController.addAction(addExistingContact)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
