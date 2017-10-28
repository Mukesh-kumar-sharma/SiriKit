//
//  ViewController.swift
//  Todd's App
//
//  Created by Nouru Muneza on 1/18/17.
//  Copyright © 2017 Nouru Muneza. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

