//
//  RegistraionViewController.swift
//  SearchableTableView
//
//  Created by Delowar on 12/6/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit
import  Firebase
class RegistraionViewController: UIViewController {

    
    @IBOutlet var nameText: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
    @IBAction func registrationButton(_ sender: Any) {
        let name = nameText.text!;
        let email = emailTextField.text!;
        let password = passwordTextField.text!;
        let confirmPassword = confirmPasswordTextField.text!;
        //Check for empty field
        if(name.isEmpty  || email.isEmpty || password.isEmpty  || confirmPassword.isEmpty){
        displayAlert(userMessage : "All field are required");
            return;
        }
        //check password match or not
        if(password != confirmPassword)
        {
            displayAlert(userMessage : "passwords do not match");
            return;
        }
        if(password.count<6){
            displayAlert(userMessage: "password must be greater or equal 6 charecter")
            return
        }
//        performSegue(withIdentifier: "goHome", sender: self)
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if error != nil{
                print("Error")
            }
            else{
                print("registration successful")
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
