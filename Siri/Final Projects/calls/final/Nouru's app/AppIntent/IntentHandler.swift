//
//  IntentHandler.swift
//  AppIntent
//
//  Created by Todd Perkins on 1/18/17.
//  Copyright © 2017 Todd Perkins. All rights reserved.
//

import Intents

class IntentHandler: INExtension,INStartAudioCallIntentHandling {
    override func handler(for intent: INIntent) -> Any? {
        return self
    }
    func handle(startAudioCall intent: INStartAudioCallIntent, completion: @escaping (INStartAudioCallIntentResponse) -> Void) {
        print("handle")
        let ua = NSUserActivity(activityType: "Call")
        let person:String = intent.contacts![0].displayName
        ua.userInfo = ["person":person]
        completion(INStartAudioCallIntentResponse(code: .continueInApp, userActivity: ua))
    }
    
    func confirm(startAudioCall intent: INStartAudioCallIntent, completion: @escaping (INStartAudioCallIntentResponse) -> Void) {
        completion(INStartAudioCallIntentResponse(code: .ready, userActivity: nil))
    }
    
    func resolveContacts(forStartAudioCall intent: INStartAudioCallIntent, with completion: @escaping ([INPersonResolutionResult]) -> Void) {
        print("resolveContacts")
        let contacts:[String] = ["Dave","James","Herman"]
        for contact in contacts {
            if intent.contacts?[0].spokenPhrase?.uppercased() == contact.uppercased() {
                let personHandle:INPersonHandle = INPersonHandle(value: "1-555-555-5555", type: .phoneNumber)
                let person:INPerson = INPerson(personHandle: personHandle, nameComponents: nil, displayName: contact, image: nil, contactIdentifier: nil, customIdentifier: nil)
                completion([INPersonResolutionResult.success(with: person)])
                return
            }
        }
        completion([INPersonResolutionResult.needsValue()])
    }
    
}

