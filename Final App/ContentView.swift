//
//  ContentView.swift
//  Final App
//
//  Created by Raphael Abano on 10/17/24.
//  App Goal: Get a random image from an API and display it on the screen
//  Additional Features: User can refresh the image, User can save the image to their photo library, Tab/Screen where user can view last 10? images, User can change API
//  API: TBD
// https://www.youtube.com/watch?v=aP_Q4YiIgYU
import SwiftUI

struct ContentView: View {
    @State private var currentImage = "placeholder"
    @State private var previousImages = [String]()
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image(currentImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                Spacer()
                HStack {
                    Button("Refresh Image") {
                        // Refresh image
                    }
                    .padding()
                    Button("Save Image") {
                        // Save image
                    }
                    .padding()
                }
                .padding()
            }
            .navigationTitle("Random Image App")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: settingsView()) {
                        Image(systemName: "gear")
                    }
                    .padding()
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
