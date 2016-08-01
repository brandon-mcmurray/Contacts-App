//
//  DetailViewController.swift
//  ContactsApp
//
//  Created by Brandon McMurray on 7/31/16.
//  Copyright © 2016 Brandon McMurray. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
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
        
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
