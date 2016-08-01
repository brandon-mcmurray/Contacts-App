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

    
}
