//
//  ViewController.swift
//  BUCentral
//
//  Created by Michael Hendrick on 7/14/18.
//  Copyright © 2018 MHendrick Productions. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController {

    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signUp(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.usernameInput.text!, password: self.passwordInput.text!, completion: { (user, error) in
            if user != nil{
                print("User has signed up!")
            }
            if error != nil{
                print(":(")
            }
            })
    }
    
    @IBAction func logIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: self.usernameInput.text!, password: self.passwordInput.text!, completion: { (user, error) in
            if user != nil{
                print("User has logged in!")
            }
            if error != nil{
                print(":(")
            }
        })
    }
}

