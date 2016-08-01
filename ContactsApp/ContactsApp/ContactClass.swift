//
//  ContactClass.swift
//  ContactsApp
//
//  Created by Brandon McMurray on 7/19/16.
//  Copyright © 2016 Brandon McMurray. All rights reserved.
//

import Foundation

class Contact {
  
    var firstName : String
    var lastName  : String
    var emailAddress : String
    var phoneNumber : String
    let contactId: String = NSUUID().UUIDString
    
    init( firstName:String, lastName:String, emailAddress: String, phoneNumber: String ){
        
        self.firstName = firstName
        self.lastName = lastName
        self.emailAddress = emailAddress
        self.phoneNumber = phoneNumber
    }
    
}