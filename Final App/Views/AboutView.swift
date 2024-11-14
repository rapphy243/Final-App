//
//  AboutView.swift
//  Final App
//
//  Created by Raphael Abano on 11/14/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            VStack {
                //https://wwdcbysundell.com/2021/using-swiftui-async-image/
                //Yes I could have just imported a local image but why not do this
                AsyncImage(url: URL(string: "https://i.rap.ph/R_Monogram_Circle_1000px-beCVHbk5.png")) { phase in
                    switch phase {
                    case .empty:
                        EmptyView() // Nothing
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 300, maxHeight: 100)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                    Text("Rapphy243")
                        .font(.title)
                    
                }
                
            }
        }
    }
}
    #Preview {
        AboutView()
    }
