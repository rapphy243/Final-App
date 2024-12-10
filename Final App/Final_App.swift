//
//  Final_AppApp.swift
//  Final App
//
//  Created by Raphael Abano on 10/17/24.
//

import SwiftUI
import SwiftData

@main
struct Final_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: SavedImage.self)
    }
}
