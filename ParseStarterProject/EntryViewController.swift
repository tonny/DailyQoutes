//
//  EntryViewController.swift
//  DailyQoutes
//
//  Created by Antonio on 1/10/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class EntryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func LogoutButton(sender: AnyObject) {
        PFUser.logOut()
        if(PFUser.currentUser() == nil){
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let mainQuotesUI : UIViewController = storyboard.instantiateViewControllerWithIdentifier("LoginUI") as UIViewController
            self.presentViewController(mainQuotesUI, animated: false, completion:nil)
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
