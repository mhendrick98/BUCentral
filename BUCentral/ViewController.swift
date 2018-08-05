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
    var dataRef: DatabaseReference!
    func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }

    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataRef = Database.database().reference()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signUp(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.usernameInput.text!, password: self.passwordInput.text!, completion: { (user, error) in
            if user != nil{
                self.dataRef.child("users").setValue(["username": self.usernameInput.text!])
                //self.dataRef.child("users").setValue(["id": self.randomString(length: 20)])
                let x = self.dataRef.queryOrdered(byChild: "users").queryEqual(toValue: self.usernameInput.text!)
                print(x)
                print("User has signed up!")
            }
            if error != nil{
                print(":(")
            }
            })
        //print(Auth.auth().currentUser?.uid)
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

