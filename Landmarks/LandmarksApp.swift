//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Steve Handy on 2024.04.29.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData() // initialize a model object
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
        #if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
