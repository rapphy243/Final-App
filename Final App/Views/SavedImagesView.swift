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
            VStack {
                if (!savedImages.isEmpty) {
                    ScrollView {
                        HStack {
                            LazyVGrid(columns: Array(repeating: GridItem(.fixed(120)), count: 3), content: {
                                if (savedImages.count > 0) {
                                    // https://www.hackingwithswift.com/forums/swiftui/compiler-warning-non-constant-range-argument-must-be-an-integer-literal/14878 basically add "id: \.self"
                                    ForEach(0..<savedImages.count, id: \.self) { index in
                                        Image(uiImage: savedImages[index])
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            // https://stackoverflow.com/questions/77975131/expand-image-when-popped-out-by-context-menu-swiftui
                                            //  https://www.hackingwithswift.com/books/ios-swiftui/adding-a-context-menu-to-an-image
                                            .contextMenu {
                                                customContextMenu(index: index, savedImages: $savedImages)
                                            }
                                            preview: {
                                                withAnimation {
                                                    Image(uiImage: savedImages[index])
                                                        .resizable()
                                                        .frame(width: 300, height: 300)
                                            }
                                        }
                                    }
                                }
                            })
                        }
                    }
                }
                else {
                    Text("No Images Saved")
                }
            }
            .navigationTitle("Saved Images")
        }
    }
}

// Had to move to its own struct bc Xcode can't typecheck quick enough
// https://www.caseyliss.com/2022/2/9/saving-to-photo-library-via-sharesheet
struct customContextMenu: View {
    @State var index : Int
    @Binding var savedImages : [UIImage]
    var body: some View {
        Button("Delete", systemImage: "trash") {
            savedImages.remove(at: index)
        }
        ShareLink(item: Image(uiImage: savedImages[index]), preview: SharePreview("Share", image: Image(uiImage: savedImages[index])))
    }
}

#Preview {
    // Test for scrolling
    // https://www.hackingwithswift.com/example-code/language/how-to-create-an-array-by-repeating-an-item
    
    @Previewable @State var savedImages: [UIImage] = [UIImage](repeating: UIImage(named: "AppIcon.png")!, count: 24)
    SavedImagesView(savedImages: $savedImages)
}
