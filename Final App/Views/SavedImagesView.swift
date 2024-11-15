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
            ScrollView {
                HStack {
                    if savedImages.isEmpty {
                        Text("No Images Saved")
                    }
                    else
                    {
                        LazyVGrid(columns: Array(repeating: GridItem(.fixed(120)), count: 3), content: {
                            if (savedImages.count > 0) {
                                //https://www.hackingwithswift.com/forums/swiftui/compiler-warning-non-constant-range-argument-must-be-an-integer-literal/14878
                                ForEach(0..<savedImages.count, id: \.self) { index in
                                    Image(uiImage: savedImages[index])
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .contextMenu { //https://www.hackingwithswift.com/books/ios-swiftui/adding-a-context-menu-to-an-image
                                            contextMenuView(index: index, savedImages: $savedImages)
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
//Had to move to it's own struct bc can't type check in reasonable amount of time
struct contextMenuView: View {
    @State var index : Int
    @Binding var savedImages : [UIImage]
    var body: some View {
        Button("Delete") {
            savedImages.remove(at: index)
        }
        ShareLink(item: Image(uiImage: savedImages[index]), preview: SharePreview("Share", image: Image(uiImage: savedImages[index])))
    }
}

#Preview {
    //https://stackoverflow.com/questions/24172180/swift-creating-an-array-of-uiimage
    //
    @Previewable @State var savedImages: [UIImage] = [
        UIImage(named: "AppIcon.png")!,
        UIImage(named: "AppIcon Dark.png")!,
        UIImage(named: "AppIcon Grayscale.png")!]
    SavedImagesView(savedImages: $savedImages)
}
