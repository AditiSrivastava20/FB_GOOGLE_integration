//
//  ViewController2.swift
//  FBIntegration
//
//  Created by Sierra 4 on 28/02/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController2: UIViewController {
    
    var username: String?
    var useridentity: String?
    var userfname: String?
    var userlname: String?
    var useremail: String?
    var dictionary: [String:AnyObject]?
    
    @IBOutlet weak var identity: UILabel!

    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblname.text = username
        lblemail.text = useremail
        firstname.text = userfname
        lastname.text = userlname
        identity.text = useridentity
        print(self.dictionary)
        if let picture = dictionary?["picture"] as? Dictionary<String, AnyObject>
        {
            if let data = picture["data"] as? Dictionary<String, AnyObject>
            {
            if let url = data["url"] as? String
            {
                
                print(url)
                image.kf.setImage(with: URL(string:url))
            }
        }
        
    }
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

