//
//  AboutView.swift
//  Final App
//
//  Created by Raphael Abano on 11/14/24.
//
// https://icon.kitchen/
import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    ZStack {
                        Image("AppIcon")
                            .resizable()
                            .frame(width: 145, height: 145)
                        //https://www.hackingwithswift.com/quick-start/swiftui/how-to-clip-a-view-so-only-part-is-visible
                            .clipShape(Circle())
                    }
                    .padding()
                    VStack {
                        Text("Random Image Generator")
                            .multilineTextAlignment(.center)
                            .font(.title)
                            .bold()
                        Text("Version 1.0")
                            .font(.subheadline)
                        Text("Created by Rapphy243")
                            .bold()
    
                    }
                        
                }

                //https://wwdcbysundell.com/2021/using-swiftui-async-image/
                //Yes I could have just imported a local image but why not do this
//                AsyncImage(url: URL(string: "https://i.rap.ph/R_Monogram_Circle_1000px-beCVHbk5.png")) { phase in
//                    switch phase {
//                    case .empty:
//                        EmptyView() // Nothing
//                    case .success(let image):
//                        image.resizable()
//                            .frame(maxWidth: 50, maxHeight: 50)
//                    case .failure:
//                        Image(systemName: "photo")
//                    @unknown default:
//                        EmptyView()
//                    }
//                    Text("Rapphy243")
//                        .font(.title)
//                        .padding()
//                }
                
            }
        }
    }
}
#Preview {
    AboutView()
}
