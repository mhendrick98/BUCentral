//
//  SearchResultsViewController.swift
//  BUCentral
//
//  Created by Michael Hendrick on 8/6/18.
//  Copyright © 2018 MHendrick Productions. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    /*
    let locationName = ["Hawaii Resort", "Mountain Expedition", "Scuba Diving"]
    
    let locationImages = [UIImage(named: "avatar"), UIImage(named: "bnd"), UIImage(named: "bg")]
    
    let locationDescription = ["Issa Hawaii", "Issa Mountain", "Issa Scuba"]
    */
    @IBOutlet weak var classNameHeader: UILabel!
    var username: String = ""
    var className: [String] = []
    var professorName: [String] = []
    var classComments: [String] = []
    var finalScore: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classNameHeader.text = className[0]
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return professorName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SearchReviewCollectionViewCell
        
        cell.professorName.text = "Professor Name: " + professorName[indexPath.row]
        cell.classComments.text = "General Comments: " + classComments[indexPath.row]
        cell.finalScore.text = "Final Score: " + finalScore[indexPath.row]
        
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
 
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
