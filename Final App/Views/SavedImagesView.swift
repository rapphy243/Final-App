//
//  SavedImagesView.swift
//  Final App
//
//  Created by Raphael Abano on 11/12/24.
//

import SwiftUI

struct SavedImagesView: View {
    @State var savedImages : [UIImage]
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
    SavedImagesView(savedImages: [])
}
