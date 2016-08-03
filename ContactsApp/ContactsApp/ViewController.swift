//
//  ViewController.swift
//  ContactsApp
//
//  Created by Brandon McMurray on 7/19/16.
//  Copyright © 2016 Brandon McMurray. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var contactTableView: UITableView!
    
  // var people: [Contact]?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataManager.sharedManager.getContact()
    
        contactTableView.dataSource = self
        contactTableView.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(onContactChanged), name: "contact_changed", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self , selector: #selector(onNewContactAdded), name: "contact_added", object: nil)
        
    }
    
    func onNewContactAdded(notification: NSNotification) {
        
        contactTableView.reloadData()
        
    }
    
    
    func onContactChanged(noticiacation: NSNotification) {
        
        contactTableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("contactCell", forIndexPath: indexPath) as? ContactTableViewCell{
            
            if let myContact : Contact = DataManager.sharedManager.people[indexPath.row] {
                
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
                    
    return DataManager.sharedManager.people.count
    
}
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
     
        performSegueWithIdentifier("Segue", sender: indexPath)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "Segue" {
           
        
            let detailVC = segue.destinationViewController as? DetailViewController
            
         
            
            if let indexPath = sender {
                   detailVC?.people = DataManager.sharedManager.people[indexPath.row]
                
            }
            
            
            
        }
    }

    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
        DataManager.sharedManager.people.removeAtIndex(indexPath.row)
            
            contactTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
        
    }

}