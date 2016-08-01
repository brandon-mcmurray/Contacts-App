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
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
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
                    
    return people!.count
    
}


}