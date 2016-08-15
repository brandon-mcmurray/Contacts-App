//
//  DetailViewController.swift
//  ContactsApp
//
//  Created by Brandon McMurray on 7/31/16.
//  Copyright © 2016 Brandon McMurray. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
       var people: Contact?
    
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var birthDate: UILabel!
    @IBOutlet weak var zodiac: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var zodiacPicker: UIPickerView!
    
    let zodiacData = ["Aries","Taurus","Gemini","Cancer","Leo","Virgo","Libra","Scorpio","Sagittarius","Pisces","Aquarius","Capricorn"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zodiacPicker.dataSource = self
        zodiacPicker.delegate = self
        
        firstName.text = people?.firstName
        lastName.text = people?.lastName
        phoneNumber.text = people?.phoneNumber
        emailAddress.text = people?.emailAddress
    }
    
    
    
    @IBAction func saveButton(sender: AnyObject) {
        
        
        if let sourceViewController = sender.sourceViewController as? DetailViewController, update = sourceViewController.people{
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                
                DataManager.sharedManager.updateContact(people!)
                 tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None )
                
                
            }
            
        }
       

        
        if let person = people {
            
            person.firstName = firstName.text ?? ""
            person.lastName = lastName.text ?? ""
            person.emailAddress = emailAddress.text ?? ""
            person.phoneNumber = phoneNumber.text ?? ""
            
            
            DataManager.sharedManager.updateContact(person)        }
        
        
    }
    
    @IBAction func addButtonTouched(sender: UIButton) {
        
        let newContact = Contact()//firstName: self.firstName.text!, lastName: self.lastName.text!, emailAddress: self.emailAddress.text!, phoneNumber: self.phoneNumber.text!)
    
        
        DataManager.sharedManager.addContact(newContact)
        
    }
    
    @IBAction func datePicked(){
      
        dateSelected()
        
        
    }
    
    func dateSelected(){
        
        let dateSelector = NSDateFormatter()
        dateSelector.dateStyle = NSDateFormatterStyle.ShortStyle
        birthDate.text = dateSelector.stringFromDate(datePicker.date)
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return zodiacData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return zodiacData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       zodiac.text = zodiacData[row]
    }
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
