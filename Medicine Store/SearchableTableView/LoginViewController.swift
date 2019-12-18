//
//  LoginViewController.swift
//  SearchableTableView
//
//  Created by Delowar on 12/6/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
//design button
        
        
        // Do any additional setup after loading the view.
    }
    func displayAlert(userMessage:String)
    {
        // create the alert
        let alert = UIAlertController(title: "Please Check !!!", message: userMessage, preferredStyle: UIAlertController.Style.alert);
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil));
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil));
        
        // show the alert
        self.present(alert, animated: true, completion: nil);
    }
    
    
    @IBAction func logInButton(_ sender: Any) {
        //get data
        let email = emailTextField.text!
        let password = passwordTextField.text!
        //check empty
        if(email.isEmpty || password.isEmpty){
            displayAlert(userMessage: "All Field are required")
        }
        if(password.count < 6){
            displayAlert(userMessage: "password must be greater or equal 6 charecter")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error != nil{
                print("Error")
            }
            else{
                print("login successful")
                self.performSegue(withIdentifier: "goHome", sender: self)
            }
        }

        
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
