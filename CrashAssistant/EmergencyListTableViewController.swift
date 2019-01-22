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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let emergencyContact = EmergencyContactsController.shared.emergencyContacts[indexPath.row]
        guard let number = emergencyContact.number else { return }
        
        let alertController = UIAlertController(title: "Emergency Contact", message: "Are you sure you wish to call this emergency contact?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let callAction = UIAlertAction(title: "Call", style: .default) { (_) in
            guard let url = URL(string: "tel://" + number) else { return }
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
    
    // MARK: - Contact Picker Method(s)
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        let number = (contact.phoneNumbers.first?.value)!.stringValue
        let contactName = "\(contact.givenName)"
        
        EmergencyContactsController.shared.addEmergencyContact(name: contactName, number: number)
        tableView.reloadData()
    }

    @IBOutlet weak var addEmergencyContactButton: UIBarButtonItem!
    @IBAction func addEmergencyContactButtonTapped(_ sender: Any) {
        // Create Action Sheet Alert
        let alertController = UIAlertController(title: "Add Emergency Contact", message: "Would you like to create or add an existing contact?", preferredStyle: .actionSheet)
        
        // Add Contact Action
        let addContact = UIAlertAction(title: "Create Contact", style: .default) { (_) in
            // Create another Alert Controller within the add option action
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
        // Access the phones contact list to add an existing contact
        let addExistingContact = UIAlertAction(title: "Add Existing Contact", style: .default) { (_) in
            let contactPicker = CNContactPickerViewController()
            contactPicker.delegate = self
            contactPicker.displayedPropertyKeys =
                [CNContactGivenNameKey, CNContactPhoneNumbersKey]
            self.present(contactPicker, animated: true, completion: nil)
        }
        
        // Cancel action for the Action Sheet
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(addContact)
        alertController.addAction(addExistingContact)
        alertController.addAction(cancelAction)
        
        // This ensures the Alert Controllers are presented for iPads
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            alertController.popoverPresentationController?.barButtonItem = self.addEmergencyContactButton
            alertController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
}
