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
    var className: [String] = []
    var professorName: [String] = []
    var classComments: [String] = []
    var finalScore: [String] = []
    
    
    @IBOutlet weak var classQuery: UITextField!
    
    func queryResults(){
        let reviewRef = db.collection("reviews")
        let query = reviewRef.whereField("className", isEqualTo: classQuery.text ?? "None").getDocuments(completion: {(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let temp = "\(document.documentID) => \(document.data()["className"] ?? "None") => \(document.data()["profName"] ?? "None") => \(document.data()["classComments"] ?? "None") => \(document.data()["finalScore"] ?? "None")"
                    print(temp)
                    self.className.append("\(document.data()["className"] ?? "Not Given")")
                    self.professorName.append("\(document.data()["profName"] ?? "Not Given")")
                    self.classComments.append("\(document.data()["classComments"] ?? "Not Given")")
                    self.finalScore.append("\(document.data()["finalScore"] ?? "Not Given")")
                    
                }
                self.performSegue(withIdentifier: "segueToResults", sender: self)
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        if segue.destination is SearchResultsViewController
        {
            let vc = segue.destination as? SearchResultsViewController
            vc?.username = self.username
            vc?.className = self.className
            vc?.professorName = self.professorName
            vc?.classComments = self.classComments
            vc?.finalScore = self.finalScore
        }
    }
    

    @IBAction func submitButton(_ sender: Any) {
        queryResults()
        
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
