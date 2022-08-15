//
//  TicTacToeApp.swift
//  TicTacToe WatchKit Extension
//
//  Created by Tristan Camejo on 16/8/2022.
//

import SwiftUI

@main
struct TicTacToeApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
