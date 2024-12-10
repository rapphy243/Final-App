//
//  SavedImagesView.swift
//  Final App
//
//  Created by Raphael Abano on 11/12/24.
//

import SwiftUI
import SwiftData

struct SavedImagesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(filter: #Predicate<SavedImage> { !$0.isPreviousImage },
           sort: \SavedImage.timestamp,
           order: .reverse) private var savedImages: [SavedImage]
    
    var body: some View {
        NavigationStack {
            VStack {
                if (!savedImages.isEmpty) {
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: GridItem(.fixed(120)), count: 3)) {
                            ForEach(savedImages) { savedImage in
                                if let uiImage = savedImage.uiImage {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .contextMenu {
                                            Button("Delete", systemImage: "trash") {
                                                modelContext.delete(savedImage)
                                                try? modelContext.save()
                                            }
                                            ShareLink(
                                                item: Image(uiImage: uiImage),
                                                preview: SharePreview("Share", image: Image(uiImage: uiImage))
                                            )
                                        }
                                        preview: {
                                            Image(uiImage: uiImage)
                                                .resizable()
                                                .frame(width: 300, height: 300)
                                        }
                                }
                            }
                        }
                    }
                } else {
                    Text("No Images Saved")
                }
            }
            .navigationTitle("Saved Images")
        }
    }
}

#Preview {
    SavedImagesView()
        .modelContainer(for: SavedImage.self, inMemory: true)
}
