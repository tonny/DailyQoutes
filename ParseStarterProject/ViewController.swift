/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
    
        if(PFUser.currentUser() != nil){
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let mainQuotesUI : UIViewController = storyboard.instantiateViewControllerWithIdentifier("MainQuotesUI") as UIViewController
            self.presentViewController(mainQuotesUI, animated: false, completion:nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginButton(sender: AnyObject) {
        LogIn()
    }
    func LogIn(){
       
        PFUser.logInWithUsernameInBackground(username.text!, password: password.text!,block:{
            (User : PFUser?, Error:NSError?) -> Void in
            if Error == nil{
                let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let mainQuotesUI : UIViewController = storyboard.instantiateViewControllerWithIdentifier("MainQuotesUI") as UIViewController
                self.presentViewController(mainQuotesUI, animated: false, completion:nil)
                /*
                dispatch_async(dispatch_get_main_queue()){
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let mainQuotesUI = storyboard.instantiateViewControllerWithIdentifier("MainQuotesUI")
                    self.presentViewController(mainQuotesUI, animated: true, completion:nil)
                }
                */
            }else{
                NSLog("Password Wrong!")
            }
            
        })
    }
}
