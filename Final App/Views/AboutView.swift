//
//  AboutView.swift
//  Final App
//
//  Created by Raphael Abano on 11/14/24.
//
import SwiftUI

struct AboutView: View {
    @Environment(\.colorScheme) var colorScheme // https://zappycode.com/tutorials/dark-mode-in-swiftui
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    if (colorScheme == .light) {
                        Image("Icon")
                            .resizable()
                            .frame(width: 145, height: 145)
                            // https://www.hackingwithswift.com/quick-start/swiftui/how-to-clip-a-view-so-only-part-is-visible
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .padding()
                    }
                    else {
                        Image("IconDark")
                            .resizable()
                            .frame(width: 145, height: 145)
                            // https://stackoverflow.com/questions/77755756/how-to-add-a-border-in-swiftui-with-clipshape
                            // https://www.hackingwithswift.com/quick-start/swiftui/how-to-render-a-gradient
                            // https://iosref.com/uihex
                            .overlay(RoundedRectangle(cornerRadius: 30).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 0.376, green: 0.58, blue: 0.918), Color(red: 0.933, green: 0.51, blue: 1) ]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2    ))
                            .padding()
                    }
                    VStack {
                        Text("Random Image Generator")
                            .multilineTextAlignment(.center)
                            .font(.title)
                            .bold()
                        Text("Version 1.0")
                            .font(.subheadline)
                        Text("By: [Rapphy243](https://github.com/Rapphy243)")
                    }
                }
                Text("Random Image Generator generates random images from a variety API sources.")
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Main Credits:")
                    .font(.title2)
                    .bold()
                // https://www.hackingwithswiftb.com/quick-start/swiftui/how-to-customize-the-way-links-are-opened-using-linkdestination
                Text("Icon made with [Icon.Kitchen](https://icon.kitchen)")
                Text("API sources from [Random Image API](https://random.responsiveimages.io), [Picsum](https://picsum.photos), and [PepeBigotes/random-image](https://random-image-pepebigotes.vercel.app/) ")
                    .multilineTextAlignment(.center)
                Text("Image downloading code from [Apple Dev Docs](https://developer.apple.com/documentation) modified with [Github Copilot](https://github.com/features/copilot)")
                    .multilineTextAlignment(.center)
            }
            .navigationTitle("About")
        }
    }
}

#Preview {
    AboutView()
}
