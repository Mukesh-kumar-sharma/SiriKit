//
//  IntentHandler.swift
//  AppIntent
//
//  Created by Todd Perkins on 1/18/17.
//  Copyright © 2017 Todd Perkins. All rights reserved.
//

import Intents

class IntentHandler: INExtension, INSendPaymentIntentHandling {
    override func handler(for intent: INIntent) -> Any? {
        return self
    }
    
    func handle(sendPayment intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
        print("handle")
        completion(INSendPaymentIntentResponse(code: .success, userActivity: nil))
    }
}

