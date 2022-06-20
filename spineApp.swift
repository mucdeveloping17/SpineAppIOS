//
//  spineApp.swift
//  spine

import SwiftUI
import FBSDKCoreKit
@main
struct spineApp: App {
    var body: some Scene {
        WindowGroup {
            if signInResponseModel.isUserLoggedIn()  {
                TabBarView()
            }
            else {
                TutorialView()
           }
        }
    }
}
