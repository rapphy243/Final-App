//
//  ContentView.swift
//  Final App
//
//  Created by Raphael Abano on 10/17/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(filter: #Predicate<SavedImage> { !$0.isPreviousImage }) private var savedImages: [SavedImage]
    @Query(filter: #Predicate<SavedImage> { $0.isPreviousImage }) private var previousImages: [SavedImage]
    
    @State private var image: UIImage?
    @State private var settings = Settings()
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else { // Placeholder if there is no image yet
                    Spacer()
                    Text("Refresh to show an image!")
                        .bold()
                }
                Spacer()
                HStack {
                    Button("Refresh Image") {
                        downloadImage(from: settings.url) { downloadedImage in
                            if let downloadedImage = downloadedImage {
                                image = downloadedImage
                                let savedImage = SavedImage(image: downloadedImage, isPrevious: true)
                                modelContext.insert(savedImage)
                                
                                // Maintain only last 15 previous images
                                let sortedPrevious = previousImages.sorted { $0.timestamp > $1.timestamp }
                                if sortedPrevious.count >= 15, let oldestImage = sortedPrevious.last {
                                    modelContext.delete(oldestImage)
                                }
                                
                                try? modelContext.save()
                            }
                        }
                    }
                    .padding()
                    Button("Save Image") {
                        if let currentImage = image {
                            let savedImage = SavedImage(image: currentImage)
                            modelContext.insert(savedImage)
                            try? modelContext.save()
                            showAlert.toggle()
                        }
                    }
                }
            }
            .navigationTitle("Generate a Image")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu(content: {
                        NavigationLink(destination: PreviousImagesView()){
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
                    NavigationLink(destination: SavedImagesView()){
                        Label("Saved Images", systemImage: "photo")
                    }
                }
            }
            .sheet(isPresented: $settings.showSettings){
                SettingsView(settings: $settings)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Image Saved"), message: Text("Image was saved to Saved Images"), dismissButton: .default(Text("OK")))
            }
        }
    }
    
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
        .modelContainer(for: SavedImage.self, inMemory: true)
}
