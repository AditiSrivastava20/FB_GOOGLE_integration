//
//  ViewController.swift
//  FBIntegration
//
//  Created by Sierra 4 on 27/02/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FacebookShare
import FBSDKLoginKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*var loginButton = LoginButton(readPermissions: [ .publicProfile ])
        
        loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])
        
        loginButton.center = view.center
        
        view.addSubview(loginButton)
        loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])*/
    }
    
    
    @IBAction func facebook(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self)
        {
            loginResult in
            switch loginResult
            {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")    }
      
    
            }
        }
    }

