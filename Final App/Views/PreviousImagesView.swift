//
//  PreviousImagesView.swift
//  Final App
//
//  Created by Raphael Abano on 11/10/24.
//

import SwiftUI
import SwiftData

struct PreviousImagesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(filter: #Predicate<SavedImage> { $0.isPreviousImage },
           sort: \SavedImage.timestamp,
           order: .reverse) private var previousImages: [SavedImage]
    
    var body: some View {
        NavigationStack {
            VStack {
                if (!previousImages.isEmpty) {
                    LazyVGrid(columns: Array(repeating: GridItem(.fixed(120)), count: 3)) {
                        ForEach(previousImages) { previousImage in
                            if let uiImage = previousImage.uiImage {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .contextMenu {
                                        Button("Delete", systemImage: "trash") {
                                            modelContext.delete(previousImage)
                                            try? modelContext.save()
                                        }
                                        Button("Save to Saved Images", systemImage: "square.and.arrow.down") {
                                            let savedImage = SavedImage(image: uiImage)
                                            modelContext.insert(savedImage)
                                            try? modelContext.save()
                                        }
                                    }
                                    preview: {
                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .frame(width: 275, height: 275)
                                    }
                            }
                        }
                    }
                    Spacer()
                } else {
                    Text("No Images Generated")
                }
            }
            .navigationTitle("Previous Images")
        }
    }
}

#Preview {
    PreviousImagesView()
        .modelContainer(for: SavedImage.self, inMemory: true)
}
