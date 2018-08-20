//
//  WriteReviewViewController.swift
//  BUCentral
//
//  Created by Michael Hendrick on 8/5/18.
//  Copyright © 2018 MHendrick Productions. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class WriteReviewViewController: UIViewController {

    var username: String = ""
    
    @IBOutlet weak var className: UITextField!
    
    @IBOutlet weak var profName: UITextField!
    
    @IBOutlet weak var classComments: UITextView!
    
    @IBOutlet weak var finalScore: UISegmentedControl!
    
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func formSubmit(_ sender: Any) {
        
        self.ref = self.db.collection("reviews").addDocument(data: [
            "className": self.className.text!,
            "profName": self.profName.text!,
            "classComments": self.classComments.text!,
            "finalScore": self.finalScore.titleForSegment(at: self.finalScore.selectedSegmentIndex) ?? "00"
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(self.ref!.documentID)")
            }
        }
    }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if segue.destination is HomePageViewController
            {
                let vc = segue.destination as? HomePageViewController
                vc?.username = self.username
                
            }
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


