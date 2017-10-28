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
        // actually send the payment here!
        let activity:NSUserActivity = NSUserActivity(activityType: "Payment")
        activity.userInfo = ["name":intent.payee!.displayName,"amount":intent.currencyAmount!.amount!.stringValue]
        completion(INSendPaymentIntentResponse(code: .inProgress, userActivity: activity))
    }
    
    func confirm(sendPayment intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
        print("confirm")
        completion(INSendPaymentIntentResponse(code: .ready, userActivity: nil))
    }
    
    func resolveCurrencyAmount(forSendPayment intent: INSendPaymentIntent, with completion: @escaping (INCurrencyAmountResolutionResult) -> Void) {
        guard let amount:Float = intent.currencyAmount?.amount?.floatValue else {
            completion(INCurrencyAmountResolutionResult.needsValue())
            return
        }
        if amount == 0 {
            completion(INCurrencyAmountResolutionResult.needsValue())
        }
        else {
            completion(INCurrencyAmountResolutionResult.success(with: intent.currencyAmount!))
        }
    }
    
    func resolvePayee(forSendPayment intent: INSendPaymentIntent, with completion: @escaping (INPersonResolutionResult) -> Void) {
        guard let payee:INPerson = intent.payee else {
            completion(INPersonResolutionResult.needsValue())
            return
        }
        let people:[String] = ["Dave","James","Herman"]
        for person in people {
            if person == payee.displayName {
                completion(INPersonResolutionResult.success(with: payee))
            }
        }
        completion(INPersonResolutionResult.needsValue())
    }
}

