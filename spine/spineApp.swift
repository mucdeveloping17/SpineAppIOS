//
//  spineApp.swift
//  spine

import SwiftUI
import FBSDKCoreKit
@main
struct spineApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
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
