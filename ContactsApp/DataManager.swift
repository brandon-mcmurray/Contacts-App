//
//  DataManager.swift
//  ContactsApp
//
//  Created by Brandon McMurray on 7/31/16.
//  Copyright © 2016 Brandon McMurray. All rights reserved.
//

import Foundation

class DataManager {
    
    static let sharedManager : DataManager = DataManager()
    
    var people = [Contact]()
    
    func getContact()-> [Contact] {
        
        
//        var contact  = Contact(firstName:"Brandon", lastName: "McMurray", emailAddress:"brandon111892@gmail.com", phoneNumber: "4048490248")
//        people.append(contact)
//        
//         = Contact(firstName:"Kelly", lastName: "McMurray", emailAddress:"anywhere@google.com", phoneNumber: "404456778")
//        people.append(contact)
//        
//        contact = Contact(firstName:"Kayla", lastName: "McMurray", emailAddress:"Kayla@McMurray.com", phoneNumber: "40484907754")
//        people.append(contact)
//        
//        contact = Contact(firstName:"Tremayne", lastName: "McMurray", emailAddress:"McMurray@Tremayne", phoneNumber: "4049862341")
//        people.append(contact)
        
        return people
    }
    
    func  updateContact( people: Contact) -> Bool {
        
        let filter = self.people.filter ({(p:Contact) -> Bool in return p.contactId == people.contactId})
        
        print(filter)
        
        let filterList = self.people.filter{$0.zodiac == .Aries}
        
        if filterList.count > 0 {
            
            let p = filterList[0]
            
            if p.contactId == people.contactId {
                
                p.firstName = people.firstName
                
                p.lastName = people.lastName
                
                p.emailAddress = people.emailAddress
                
                p.phoneNumber = people.phoneNumber
                
                
                NSNotificationCenter.defaultCenter().postNotificationName("contact_changed", object: self , userInfo: ["People" : p])
                
                return true
            }
        }
        
        return false
    }
    
    
    func addContact(contact : Contact) {
        
        
        self.people.append(contact)
        
        saveContact()
        
        NSNotificationCenter.defaultCenter().postNotificationName("contact_added", object: nil, userInfo: ["Contact" : contact])
        
        
    }
    
    
    func saveContact() {
        
        if NSKeyedArchiver.archiveRootObject(people, toFile: Contact.ArchivalURL.path!){
            
            print("Succesfully saved")
        }else {
            print("Did not save")
        }
        
    }
    
    func loadContact () -> [Contact]? {
        
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Contact.ArchivalURL.path!) as? [Contact]
    }
    
    private func parseContact(jsonDict : [String:AnyObject]) -> Contact {
        
        let newContact = Contact()
        
        newContact.phoneNumber = jsonDict["phone"] as? String
        
        if let fullName = jsonDict["name"] as? String {
            
            let names = parseName(fullName)
            newContact.firstName = names?.first
            newContact.lastName = names?.last
        }
        return newContact
    }
    func parseName(fullName : String) -> (first: String , last: String)? {
        let names = fullName.componentsSeparatedByString(" ")
        if names.count > 1 {
            return (first:names[0], last:names[1])
        }
        
        return nil
    }
    func syncContacts() {
        
        let url = NSURL(string: "http://jsonplaceholder.typicode.com/users")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { data, response, err in
            if err != nil {
                print("Got an error: \(err)")
            }
            else {
                do {
                    
                    if let results : [[String : AnyObject]] = try
                        NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? [[String : AnyObject]] {
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            for jsonDict in results {
                                let newContact = self.parseContact(jsonDict)
                                self.people.append(newContact)
                                NSNotificationCenter.defaultCenter().postNotificationName("contact_added", object: nil, userInfo: ["Contact" : newContact])
                                print(self.people)
                            }
                        })
                    }
                }
                catch {
                    print("Failed to fetch: \(error)")
                }
            }
        }
        
        task.resume()
    }
}



