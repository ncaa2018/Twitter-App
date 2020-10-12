//
//  LoginViewController.swift
//  Twitter
//
//  Created by loan on 10/12/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //once page shows up? What do we watch to do --> check userDefault, whether logged in
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            //run segue, dont ask to log in again
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }

    @IBAction func onLoginButton(_ sender: Any) {
        let myURL = "https://api.twitter.com/oauth/request_token"
        UserDefaults.standard.set(true, forKey: "userLoggedIn")
        
        TwitterAPICaller.client?.login(url: myURL, success: { self.performSegue(withIdentifier: "loginToHome", sender: self)}, failure: { (Error) in
                print("could not login")
            
        })
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
