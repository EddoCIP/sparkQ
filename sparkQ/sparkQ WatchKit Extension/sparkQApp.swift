//
//  sparkQApp.swift
//  sparkQ WatchKit Extension
//
//  Created by Eddo Careera Iriyanto Putra on 14/07/22.
//

import SwiftUI

@main
struct sparkQApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .navigationTitle("sparkQ")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
