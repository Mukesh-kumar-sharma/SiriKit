///
//  AppDelegate.swift
//  Todd's App
//
//  Created by Nouru Muneza on 1/18/17.
//  Copyright © 2017 Nouru Muneza. All rights reserved.
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
        if let album = userActivity?.userInfo?["album"] as? String {
            label.text = "Showing photos from \(album) album."
        }
        else {
            label.text = "User info is \(userActivity?.userInfo)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

