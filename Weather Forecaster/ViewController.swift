//
//  ViewController.swift
//  Weather Forecaster
//
//  Created by Talha Babar on 7/7/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
    private let LoginSegueIdentifier = "SuccessfulLoginSegue"

    @IBOutlet weak var loginButton: FBSDKLoginButton
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.loginButton.readPermissions = ["public_profile","email"]
        if FBSDKAccessToken.currentAccessToken() != nil {
            self.performSegueWithIdentifier(LoginSegueIdentifier, sender: self)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     override func viewControllerForUnwindSegueAction(action: Selector, fromViewController: UIViewController, withSender sender: AnyObject?) -> UIViewController? {
        if FBSDKAccessToken.currentAccessToken() != nil {
            self.performSegueWithIdentifier(LoginSegueIdentifier, sender: self)
            
        }
        return self
    }
    
    func loginSuccessfulSegue(){
        
        
    }
}

