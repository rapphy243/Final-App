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
    @State private var image: UIImage? = nil
    @State private var previousImages = [UIImage]()
    @State private var savedImages = [UIImage]()
    @State private var url = URL(string: "https://picsum.photos/1000") //This website doesn't return an image on school wifi :(
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 350, height: 350)
                } else { //set a placeholder image if there is no image yet
                    Image("placeholder")
                        .resizable()
                        .frame(width: 350, height: 350)
                }
                Spacer()
                HStack {
                    Button("Refresh Image") {
                        //Generated part of prompt below
                        downloadImage(from: url!) { downloadedImage in
                            if let downloadedImage = downloadedImage {
                                image = downloadedImage
                                previousImages.append(downloadedImage)
                            }
                        }
                    }
                    .padding()
                    Button("Save Image") {
                        if let image = image {
                            if !savedImages.contains(image) {
                                savedImages.append(image)
                            }
                            //Add Pop up an alert saying image was saved
                            
                        }
                    }
                }
            }
            .navigationTitle("Generate a Image")
            .toolbar {
                // https://swiftwithmajid.com/2020/08/05/menus-in-swiftui
                ToolbarItem(placement: .topBarTrailing) {
                    Menu(content: {
                        NavigationLink(destination: SettingsView()){
                            Label("Settings", systemImage: "gear")
                        }
                    }, label: {
                        Image(systemName: "ellipsis")
                    })
                }
                ToolbarItem(placement: .topBarLeading){
                    NavigationLink(destination: PreviousImagesView(previousImages: previousImages)){
                        Label("Previous Images", systemImage: "photo")
                    }
                }
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
