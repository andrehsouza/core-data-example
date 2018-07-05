//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Andre on 01/07/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listAllCustomers()
    }
   
    @IBAction func touchSave(_ sender: Any) {
        guard
            let name = nameField.text,
            let email = emailField.text,
            let password = passwordField.text
            else { return }
        
        let customer = Customer()
        customer.name = name
        customer.email = email
        customer.password = password
        
        CoreDataStack.sharedInstance.saveContext()
        
        listAllCustomers()
        
        nameField.text = ""
        emailField.text = ""
        passwordField.text = ""
    }
    
    func listAllCustomers() {
        let allCustomers = Customer.fetchAll()
        allCustomers.forEach { customer in
            print("---------------------------------")
            print("Name: \(customer.name)")
            print("E-mail: \(customer.email)")
            print("Password: \(customer.password)")
        }
    }

}

