//
//  AppDelegate.swift
//  Todd's App
//
//  Created by Nouru Muneza on 1/18/17.
//  Copyright © 2017 Nouru Muneza. All rights reserved.
//

import Intents

class IntentHandler: INExtension, INStartWorkoutIntentHandling {
    override func handler(for intent: INIntent) -> Any? {
        return self
    }
    func handle(startWorkout intent: INStartWorkoutIntent, completion: @escaping (INStartWorkoutIntentResponse) -> Void) {
        let activity = NSUserActivity(activityType: "Workout")
        let workout:String = intent.workoutName!.spokenPhrase!
        activity.userInfo = ["workoutName":workout]
        completion(INStartWorkoutIntentResponse(code: .continueInApp, userActivity: activity))
    }
    
    func confirm(startWorkout intent: INStartWorkoutIntent, completion: @escaping (INStartWorkoutIntentResponse) -> Void) {
        completion(INStartWorkoutIntentResponse(code: .ready, userActivity: nil))
    }
    
    func resolveWorkoutName(forStartWorkout intent: INStartWorkoutIntent, with completion: @escaping (INSpeakableStringResolutionResult) -> Void) {
        
        if let workout = intent.workoutName {
            completion(INSpeakableStringResolutionResult.success(with: workout))
        }
        else {
            completion(INSpeakableStringResolutionResult.needsValue())
        }
        
    }
}

