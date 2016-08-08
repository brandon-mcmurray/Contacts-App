//
//  ContactClass.swift
//  ContactsApp
//
//  Created by Brandon McMurray on 7/19/16.
//  Copyright © 2016 Brandon McMurray. All rights reserved.
//

import Foundation

class Contact : NSObject, NSCoding{
  
    var firstName : String?
    var lastName  : String?
    var emailAddress : String?
    var phoneNumber : String?
    let contactId: String = NSUUID().UUIDString
    
    init( firstName:String, lastName:String, emailAddress: String, phoneNumber: String ){
        
        self.firstName = firstName
        self.lastName = lastName
        self.emailAddress = emailAddress
        self.phoneNumber = phoneNumber
    }
    
    
    override init() {
        super.init()
    }
    
    
    
   @objc func encodeWithCoder(aCoder: NSCoder){
        
    if let fn = self.firstName {
        
        aCoder.encodeObject(fn, forKey: "FirstName")
        
    }
    if let ln = self.lastName{
        
        aCoder.encodeObject(ln, forKey: "LastName")

        
    }
    if let ea = self.emailAddress{
       
        aCoder.encodeObject(ea , forKey: "EmailAddress")

        
    }
    if let ph = self.phoneNumber {
        aCoder.encodeObject(ph, forKey: "PhoneNumber")

        
    }
        
    }
    @objc required init?(coder aDecoder: NSCoder){
        
        self.firstName = aDecoder.decodeObjectForKey("FirstName") as? String
        
          self.lastName = aDecoder.decodeObjectForKey("LastName") as? String
        
        self.emailAddress = aDecoder.decodeObjectForKey("EmailAddress") as? String
        
        self.phoneNumber = aDecoder.decodeObjectForKey("PhoneNUmber") as? String
        
    }
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    
    static let ArchivalURL = DocumentsDirectory.URLByAppendingPathComponent("contacts")
    
}