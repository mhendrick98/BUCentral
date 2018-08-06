//
//  SearchReviewViewController.swift
//  BUCentral
//
//  Created by Michael Hendrick on 8/5/18.
//  Copyright © 2018 MHendrick Productions. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class SearchReviewViewController: UIViewController {

    let db = Firestore.firestore()
    var username: String = ""
    
    @IBOutlet weak var tempInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let usersRef = db.collection("reviews")
        let query = usersRef.whereField("className", isEqualTo: "test").getDocuments(completion: {(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let temp = "\(document.documentID) => \(document.data()["className"] ?? "None") => \(document.data()["profName"] ?? "None") => \(document.data()["classComments"] ?? "None") => \(document.data()["finalScore"] ?? "None")"
                    print(temp)
                    self.tempInfo?.text = self.tempInfo!.text! + "***** NEW CLASS *****" + temp
                }
            }
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is HomePageViewController
        {
            let vc = segue.destination as? HomePageViewController
            vc?.username = self.username
            
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

}
