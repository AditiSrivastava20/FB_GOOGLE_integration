//
//  ViewController3.swift
//  FBIntegration
//
//  Created by Sierra 4 on 28/02/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    var first_name: String?
    var Lastname: String?
    var iden: String?
    var mail: String?
    
    @IBOutlet weak var lblmail: UILabel!
    @IBOutlet weak var lblFirstname: UILabel!
  
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblLastname: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblFirstname.text = first_name
        lblLastname.text = Lastname
        lblId.text = iden
        lblmail.text = mail
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
