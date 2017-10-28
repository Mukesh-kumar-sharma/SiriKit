//
//  AppDelegate.swift
//  Todd's App
//
//  Created by Nouru Muneza on 1/18/17.
//  Copyright © 2017 Nouru Muneza. All rights reserved.
//
import Intents

class IntentHandler: INExtension, INSearchForPhotosIntentHandling {
    override func handler(for intent: INIntent) -> Any? {
        return self
    }
    
    func handle(searchForPhotos intent: INSearchForPhotosIntent, completion: @escaping (INSearchForPhotosIntentResponse) -> Void) {
        print("handle searchForPhotos")
        // example phrase "search for photos tagged cats in Todd's App"
        let ua:NSUserActivity = NSUserActivity(activityType: "Photos")
        ua.userInfo = ["album":intent.albumName!]
        completion(INSearchForPhotosIntentResponse(code: .continueInApp, userActivity: ua))
    }
    
    func confirm(searchForPhotos intent: INSearchForPhotosIntent, completion: @escaping (INSearchForPhotosIntentResponse) -> Void) {
        completion(INSearchForPhotosIntentResponse(code: .ready, userActivity: nil))
    }
    
    func resolveAlbumName(forSearchForPhotos intent: INSearchForPhotosIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if let album = intent.albumName {
            completion(INStringResolutionResult.success(with:
                album))
            return
        }
        completion(INStringResolutionResult.needsValue())
    }
    
}

