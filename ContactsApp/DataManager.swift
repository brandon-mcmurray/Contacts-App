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
        
        
        var contact  = Contact(firstName:"Brandon", lastName: "McMurray", emailAddress:"brandon111892@gmail.com", phoneNumber: "4048490248")
        people.append(contact)
        
        contact = Contact(firstName:"Kelly", lastName: "McMurray", emailAddress:"anywhere@google.com", phoneNumber: "404456778")
        people.append(contact)
        
        contact = Contact(firstName:"Kayla", lastName: "McMurray", emailAddress:"Kayla@McMurray.com", phoneNumber: "40484907754")
        people.append(contact)
        
        contact = Contact(firstName:"Tremayne", lastName: "McMurray", emailAddress:"McMurray@Tremayne", phoneNumber: "4049862341")
        people.append(contact)
    
        return people
    }

    func  updateContact( people: Contact) -> Bool {
        
        for p in self.people {
            
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
        
        NSNotificationCenter.defaultCenter().postNotificationName("contact_added", object: nil, userInfo: ["Contact" : contact])
    }
    
    
    func saveContact() {
        
        let sucessfulSave = NSKeyedArchiver.archiveRootObject(people, toFile: Contact.ArchivalURL.path!)
        
    }
    
    func loadContact () -> [Contact]? {
        
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Contact.ArchivalURL.path!) as? [Contact]
    }
    
}
