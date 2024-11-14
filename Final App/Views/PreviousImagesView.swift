//
//  pastImagesView.swift
//  Final App
//
//  Created by Raphael Abano on 11/10/24.
//

import SwiftUI

struct PreviousImagesView: View {
    @State var previousImages : [UIImage]
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
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
                                }
                            }
                        })
                    }
                }
                
            }
            .navigationTitle("Previous Images")
        }
    }
}

#Preview {
    PreviousImagesView(previousImages: [])
}
