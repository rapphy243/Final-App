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
                    Image(uiImage: savedImages[0])
                        .resizable()
                        .frame(width: 350, height: 350)
                }
            }
            .navigationTitle("Saved Images")
        }
    }
}

#Preview {
    SavedImagesView(savedImages: [])
}
