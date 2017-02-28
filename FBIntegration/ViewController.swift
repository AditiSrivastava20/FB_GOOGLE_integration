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
import Kingfisher
import GoogleSignIn
import Google

class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate{
    
    @IBOutlet weak var googlelogin: GIDSignInButton!
    
    var nameOfUser: Any?
    var fname: Any?
    var lname: Any?
    var useid: Any?
    var EmailAdress: Any?
    
    var idGoogle: Any?
    var lastnameGoogle: Any?
    var firstnameGoogle: Any?
    var mailid: Any?
    
    var dictionary: [String : AnyObject]!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().clientID = "665120892073-mdt25m5g72rk53bfq59p4p707emckg8a.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        /*var loginButton = LoginButton(readPermissions: [ .publicProfile ])
        
        loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])
        
        loginButton.center = view.center
        
        view.addSubview(loginButton)
        loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])*/
    }
    
    @IBAction func google(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        //self.sign(signIn, present: viewController)
        self.present(viewController, animated: true, completion: nil)
        print("user Signed in")
    }
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        //self.sign(signIn, dismiss: viewController)
        self.dismiss(animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        //fullname=user.profile.name
        idGoogle=user.userID
        firstnameGoogle=user.profile.givenName
        lastnameGoogle=user.profile.familyName
        mailid=user.profile.email
        
        if let err = error {
            print("Failed to log into Google",err)
            return
        }
        print("Logged in successfully",user.profile.email)
        print(user.profile.givenName)
        self.performSegue(withIdentifier: "seguelink2", sender: self)

    }
    @IBAction func facebook(_ sender: UIButton) {
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
                print("Logged in!")
                self.getFBUserData()
                loginManager.logOut()
                print(loginResult)
            }
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier=="seguelink"){
        if let destinationViewController=segue.destination as? ViewController2{
            destinationViewController.username = nameOfUser as! String?
         destinationViewController.userfname = fname as! String?
            destinationViewController.useremail = EmailAdress as! String?
              destinationViewController.userlname = lname as! String?
            destinationViewController.useridentity = useid as! String?
            destinationViewController.dictionary = self.dictionary
        }
    }
    else if(segue.identifier=="seguelink2"){
    if let destinationViewController=segue.destination as? ViewController3{
    destinationViewController.first_name = firstnameGoogle as! String?
    destinationViewController.Lastname = lastnameGoogle as! String?
    destinationViewController.iden = idGoogle as! String?
    }
    }
}


func getFBUserData(){
    if ((FBSDKAccessToken.current()) != nil){
        FBSDKGraphRequest(graphPath: "me", parameters:["fields": "id, name, first_name, last_name, picture.type(large), email "]).start(completionHandler:{(connection, result,error) ->
            Void in
            if(error == nil){
            self.dictionary = result as! [String: AnyObject]
            print(result!)
            print(self.dictionary!)
            print("***", self.dictionary["last_name"] ?? "")
            print("***", self.dictionary["email"] ?? "")
                let tempData = self.dictionary["picture"]!
                let userData = tempData["data"]!
                self.nameOfUser = self.dictionary["name"]
                self.EmailAdress = self.dictionary["email"]
                self.fname = self.dictionary ["first_name"]
                self.lname = self.dictionary ["last_name"]
                self.useid = self.dictionary ["id"]
                self.performSegue(withIdentifier:"seguelink" , sender: self)
                print(tempData)
                print(userData!)
                
        }
    })
}
}
}
