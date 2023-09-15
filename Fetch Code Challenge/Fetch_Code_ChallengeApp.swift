//
//  Fetch_Code_ChallengeApp.swift
//  Fetch Code Challenge
//
//  Created by Robert Steed on 9/7/23.
//

import SwiftUI

@main
struct Fetch_Code_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            NewMealView(meal: Meal())
        }
    }
}
