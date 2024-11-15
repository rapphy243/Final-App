//
//  pastImagesView.swift
//  Final App
//
//  Created by Raphael Abano on 11/10/24.
//

import SwiftUI

struct PreviousImagesView: View {
    @Binding var previousImages : [UIImage]
    @Binding var savedImages : [UIImage]
    var body: some View {
        NavigationStack {
            VStack {
                if previousImages.isEmpty {
                    Text("No Images Saved")
                }
                else
                {
                    LazyVGrid(columns: Array(repeating: GridItem(.fixed(120)), count: 3), content: {
                        if (previousImages.count > 0) {
                            //https://www.hackingwithswift.com/forums/swiftui/compiler-warning-non-constant-range-argument-must-be-an-integer-literal/14878
                            ForEach(0..<previousImages.count, id: \.self) { index in
                                Image(uiImage: previousImages[index])
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .contextMenu { //https://www.hackingwithswift.com/books/ios-swiftui/adding-a-context-menu-to-an-image
                                        Button("Delete") {
                                            previousImages.remove(at: index)
                                        }
                                        Button("Save to Saved Images") {
                                            savedImages.append(previousImages[index])
                                        }
                                }
                            }
                        }
                    })
                    Spacer()
                }
            }
            .navigationTitle("Previous Images")
        }
    }
}

#Preview {
    //https://stackoverflow.com/questions/24172180/swift-creating-an-array-of-uiimage
    @Previewable @State var previousImages: [UIImage] = [
        UIImage(named: "AppIcon.png")!,
        UIImage(named: "AppIcon Dark.png")!,
        UIImage(named: "AppIcon Grayscale.png")!]
    @Previewable @State var savedImages = [UIImage]()
    PreviousImagesView(previousImages: $previousImages, savedImages: $savedImages)
}
