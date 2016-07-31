//
//  ViewController.swift
//  ContactsApp
//
//  Created by Brandon McMurray on 7/19/16.
//  Copyright © 2016 Brandon McMurray. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var contactTableView: UITableView!
    
   var people: [Contact]?
//    var people = [Contact]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactTableView.dataSource = self
        
        print("VIEWDIDLOAD got called")
        
        addContacts()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addContacts() {
        
        print("Add contacts worked!!!")
        
        var contact  = Contact(firstName:"Brandon", lastName: "McMurray", emailAddress:"brandon111892@gmail.com", phoneNumber: 4048490248 )
        
        people = [contact]
        people!.append(contact)
        
        contact = Contact(firstName:"Kelly", lastName: "McMurray", emailAddress:"anywhere@google.com", phoneNumber: 404456778)
        people!.append(contact)
        
        contact = Contact(firstName:"Kayla", lastName: "McMurray", emailAddress:"Kayla@McMurray.com", phoneNumber: 40484907754)
        people!.append(contact)
        
        
        contact = Contact(firstName:"Tremayne", lastName: "McMurray", emailAddress:"McMurray@Tremayne", phoneNumber: 4049862341 )
        people!.append(contact)

        
        
        
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("CELLFORROW GOT CALLED")
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("contactCell", forIndexPath: indexPath) as? ContactTableViewCell{
            
            if let myContact : Contact = people![indexPath.row] {
                
                let contactName : String = myContact.firstName + " " + myContact.lastName
                
                cell.contactLabel.text = contactName
                }
            
                return cell
            }
        
        return UITableViewCell()
    }
    
    
    
                
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
                
                
func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    print("NUMBEROFROWS GOT CALLED")
                    
    return people!.count
    
}


}