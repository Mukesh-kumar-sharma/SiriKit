//
//  ViewController.swift
//  Todd's App
//
//  Created by Todd Perkins on 1/18/17.
//  Copyright © 2017 Todd Perkins. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        INPreferences.requestSiriAuthorization { (status:INSiriAuthorizationStatus) in
            switch (status) {
            case INSiriAuthorizationStatus.authorized :
                print("siri is authorized")
                break
            default :
                print("siri is not authorized")
            }
        }
    }
    
    func showData() {
        let name = userActivity!.userInfo?["name"] as! String
        let amount = userActivity!.userInfo?["amount"] as! String
        label.text = "You sent $\(amount) to \(name)."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

