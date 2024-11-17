//
//  ContentView.swift
//  Final App
//
//  Created by Raphael Abano on 10/17/24.
//  App Goal: Get a random image from an API and display it on the screen
//  Additional Features: User can refresh the image, User can save the image to their photo library, Tab/Screen where user can view last 10? images, User can change API
// https://www.youtube.com/watch?v=aP_Q4YiIgYU

import SwiftUI

struct ContentView: View {
    @State private var image: UIImage? = nil //Displayed Image
    @State private var previousImages = [UIImage]() //Will have a max of 15 Images
    @State private var previousImagesIndex = 0
    @State private var savedImages = [UIImage]() //Unlimited Images
    @State private var settings = Settings()
    @State private var showAlert = false
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 350, height: 350)
                } else { //Placeholder if there is no image yet
                   Text("Refresh to show an image!")
                        .bold()
                }
                Spacer()
                HStack {
                    Button("Refresh Image") {
                        //Generated part of prompt below
                        downloadImage(from: settings.url) { downloadedImage in
                            if let downloadedImage = downloadedImage {
                        //End of prompt
                                image = downloadedImage
                                if (previousImages.count < 15) {
                                    previousImages.append(downloadedImage)
                                    previousImagesIndex += 1
                                }
                                else {
                                    if (previousImagesIndex >= 15){
                                        previousImagesIndex = 0
                                    }
                                    previousImages[previousImagesIndex] = downloadedImage
                                    previousImagesIndex += 1
                                }
                            }
                        }
                    }
                    .padding()
                    Button("Save Image") {
                        if let image = image {
                            if !savedImages.contains(image) { //Only prevents current image being saved multiple times, not future images of the same image
                                savedImages.append(image)
                                showAlert.toggle()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Generate a Image")
            .toolbar {
                // https://swiftwithmajid.com/2020/08/05/menus-in-swiftui
                ToolbarItem(placement: .topBarTrailing) {
                    Menu(content: {
                        NavigationLink(destination: PreviousImagesView(previousImages: $previousImages, savedImages: $savedImages)){
                            Label("Previous Images", systemImage: "folder")
                        }
                        Button("Settings", systemImage: "gear") {
                            settings.showSettings.toggle()
                        }
                        NavigationLink(destination: AboutView()) {
                            Label("About", systemImage: "info.circle")
                        }
                    }, label: {
                        Image(systemName: "ellipsis")
                    })
                }
                ToolbarItem(placement: .topBarLeading){
                    NavigationLink(destination: SavedImagesView(savedImages: $savedImages)){
                        Label("Saved Images", systemImage: "photo")
                    }
                }
            }
            .sheet(isPresented: $settings.showSettings){
                //https://sarunw.com/posts/swiftui-dismiss-sheet/#how-to-dismiss-sheet-with-%40binding
                SettingsView(settings: $settings)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Image Saved"), message: Text("Image was saved to Saved Images"), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    // Github Copilot Prompt "How can I make this download and return a file"
    // "this" being code from listing 1 in https://developer.apple.com/documentation/foundation/url_loading_system/downloading_files_from_websites"
    // This basically gets image from a url
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
        }
        task.resume()
    }
}

#Preview {
    ContentView()
}
