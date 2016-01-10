//
//  RegisterViewController.swift
//  DailyQoutes
//
//  Created by Antonio on 1/10/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstPasswordTextField: UITextField!
    @IBOutlet weak var secondPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButton(sender: AnyObject) {
        let username = usernameTextField.text!
        let email = emailTextField.text!
        let fpassword = firstPasswordTextField.text!
        let spassword = secondPasswordTextField.text!
        
        // we check if the fields are empty
        if(username.isEmpty || fpassword.isEmpty || spassword.isEmpty || email.isEmpty){
            displayMyAlertMessage("All fields are required");
            return
        }
        
        // we check that passwords are the same
        if(fpassword != spassword){
            displayMyAlertMessage("Password do not match!")
            return
        }
        
        // we send data to parse server
        let user = PFUser()
        user.username = username
        user.password = fpassword
        user.email = email
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if error == nil {
                // Hooray! Let them use the app now.
                dispatch_async(dispatch_get_main_queue()){
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let mainQuotesUI = storyboard.instantiateViewControllerWithIdentifier("MainQuotesUI")
                    self.presentViewController(mainQuotesUI, animated: true, completion:nil)
                }
            } else {
                
                self.displayMyAlertMessage("Ups!, something was wrong!!")
            }
        }
    }
    
    @IBAction func backLogin(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func displayMyAlertMessage(message : String){
        let myAlert = UIAlertController(title: "Alert", message:message, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAlert = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAlert)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
