//
//  DetailViewController.swift
//  ContactsApp
//
//  Created by Brandon McMurray on 7/31/16.
//  Copyright © 2016 Brandon McMurray. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
       var people: Contact?
    
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstName.text = people?.firstName
        lastName.text = people?.lastName
        phoneNumber.text = people?.phoneNumber
        emailAddress.text = people?.emailAddress
    }
    
    
    
    @IBAction func saveButton(sender: AnyObject) {
        
        
        if let sourceViewController = sender.sourceViewController as? DetailViewController, update = sourceViewController.people{
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                
                DataManager.sharedManager.updateContact(people!)
                 tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None )
                
                
            }
            
        }
       

        
        if let person = people {
            
            person.firstName = firstName.text!
            person.lastName = lastName.text!
            person.emailAddress = emailAddress.text!
            person.phoneNumber = phoneNumber.text!
            
            
            DataManager.sharedManager.updateContact(person)        }
        
        
    }
    
    @IBAction func addButtonTouched(sender: UIButton) {
        
        let newContact = Contact(firstName: self.firstName.text!, lastName: self.lastName.text!, emailAddress: self.emailAddress.text!, phoneNumber: self.phoneNumber.text!)
    
        
        DataManager.sharedManager.addContact(newContact)
        
    }
    
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
