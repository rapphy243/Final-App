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
            HStack {
                if previousImages.isEmpty {
                    Text("No Images Generated")
                }
                else
                {
                    Image(uiImage: previousImages[0])
                        .resizable()
                        .frame(width: 350, height: 350)
                }
            }
            .navigationTitle("Previous Images")
        }
    }
}

#Preview {
    PreviousImagesView(previousImages: [])
}
