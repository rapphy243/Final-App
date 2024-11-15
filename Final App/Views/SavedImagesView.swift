//
//  SavedImagesView.swift
//  Final App
//
//  Created by Raphael Abano on 11/12/24.
//

import SwiftUI

struct SavedImagesView: View {
    @Binding var savedImages : [UIImage]
    var body: some View {
        NavigationStack {
            HStack {
                if savedImages.isEmpty {
                    Text("No Images Saved")
                }
                else
                {
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: GridItem(.fixed(120)), count: 3), content: {
                            if (savedImages.count > 0) {
                                //https://www.hackingwithswift.com/forums/swiftui/compiler-warning-non-constant-range-argument-must-be-an-integer-literal/14878
                                ForEach(0..<savedImages.count, id: \.self) { index in
                                    Image(uiImage: savedImages[index])
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .contextMenu { //https://www.hackingwithswift.com/books/ios-swiftui/adding-a-context-menu-to-an-image
                                            Button("Delete") {
                                                savedImages.remove(at: index)
                                            }
                                            Button("Save to Image Gallery") {
                                                UIImageWriteToSavedPhotosAlbum(savedImages[index], nil, nil, nil)
                                            }
                                        }
                                    
                                }
                            }
                        })
                    }
                }
            }
            .navigationTitle("Saved Images")
        }
    }
}

#Preview {
    @Previewable @State var savedImages = [UIImage]()
    SavedImagesView(savedImages: $savedImages)
}
