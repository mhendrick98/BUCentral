//
//  HomePageViewController.swift
//  
//
//  Created by Michael Hendrick on 8/5/18.
//

import UIKit
import Firebase
import FirebaseFirestore

class HomePageViewController: UIViewController {
    
    var username: String = ""
    @IBOutlet weak var usernameWelcome: UILabel!
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameWelcome?.text = "Welcome back, " + username
        /*let usersRef = db.collection("users")
        let query = usersRef.whereField("email", isEqualTo: username).getDocuments(completion: {(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data()["email"] ?? "None")")
                }
            }
        })
 */

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is SearchReviewViewController
        {
            let vc = segue.destination as? SearchReviewViewController
            vc?.username = self.username
            
        }
        if segue.destination is WriteReviewViewController
        {
            let vc = segue.destination as? WriteReviewViewController
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
