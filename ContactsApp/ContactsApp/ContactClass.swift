//
//  ContactClass.swift
//  ContactsApp
//
//  Created by Brandon McMurray on 7/19/16.
//  Copyright © 2016 Brandon McMurray. All rights reserved.
//

import Foundation

class Contact : NSObject, NSCoding {
    
    enum Zodiac : Int{
        
        case Aries,Taurus,Gemini,Cancer,Leo,Virgo,Libra,Scorpio,Sagittarius,Pisces,Aquarius,Capricorn
    }
    
    
  
    var firstName : String?
    var lastName  : String?
    var emailAddress : String?
    var phoneNumber : String?
    var zodiac: Zodiac?
    var birthDate: NSDate?
    let contactId: String = NSUUID().UUIDString
    
//    init( firstName:String, lastName:String, emailAddress: String, phoneNumber: String, zodiac: Zodiac, birthDate: NSDate) {
//        
//        self.firstName = firstName
//        self.lastName = lastName
//        self.emailAddress = emailAddress
//        self.phoneNumber = phoneNumber
//        self.zodiac = zodiac
//        self.birthDate = birthDate
//    }
    
    
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
    
    
    if let zod = self.zodiac , let z = zod.rawValue as? Int {
        aCoder.encodeInteger(z, forKey: "ZodiacSign")
    }
  
    
    if let bd = self.birthDate {
        
        aCoder.encodeObject(bd, forKey: "BirthDate")
    }
        
    }
    @objc required init?(coder aDecoder: NSCoder){
        
        self.firstName = aDecoder.decodeObjectForKey("FirstName") as? String
        
          self.lastName = aDecoder.decodeObjectForKey("LastName") as? String
        
        self.emailAddress = aDecoder.decodeObjectForKey("EmailAddress") as? String
        
        self.phoneNumber = aDecoder.decodeObjectForKey("PhoneNumber") as? String
        
        self.birthDate = aDecoder.decodeObjectForKey("BirthDate") as? NSDate
        
        if let zd = aDecoder.decodeObjectForKey("ZodiacSign") as? Int {
            
            self.zodiac = Zodiac(rawValue: zd)
            
        }
        
        
        
    }
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    
    static let ArchivalURL = DocumentsDirectory.URLByAppendingPathComponent("contacts")
    
}