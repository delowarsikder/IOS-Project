//
//  HomeViewController.swift
//  SearchableTableView
//
//  Created by Delowar on 12/6/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit
import Firebase
class HomeViewController: UIViewController {

    
    @IBAction func signOutButton(_ sender: Any) {
    
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        guard (navigationController?.popToRootViewController(animated: true)) != nil else {
            print("you are signed out")
            performSegue(withIdentifier: "goLogin", sender: self)
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
