//
//  AboutView.swift
//  Final App
//
//  Created by Raphael Abano on 11/14/24.
//
import SwiftUI

struct AboutView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    //https://zappycode.com/tutorials/dark-mode-in-swiftui
                    ZStack {
                        if (colorScheme == .light) {
                            // https://icon.kitchen/
                            Image("Icon")
                                .resizable()
                                .frame(width: 145, height: 145)
                            //https://www.hackingwithswift.com/quick-start/swiftui/how-to-clip-a-view-so-only-part-is-visible
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                        else {
                            Image("IconDark")
                                .resizable()
                                .frame(width: 145, height: 145)
                        }
                    }
                    VStack {
                        Text("Random Image Generator")
                            .multilineTextAlignment(.center)
                            .font(.title)
                            .bold()
                        Text("Version 1.0")
                            .font(.subheadline)
                        Text("By: Rapphy243")
                    }
                }
                Text("Random Image Generator generates random images from a variety API sources.")
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Main Credits:")
                    .font(.title2)
                    .bold()
                //https://www.hackingwithswiftb.com/quick-start/swiftui/how-to-customize-the-way-links-are-opened-using-linkdestination
                Text("Icon made with [Icon.Kitchen](https://icon.kitchen)")
                Text("API sources from [Random Image API](https://random.responsiveimages.io), [Picsum](https://picsum.photos), and [PepeBigotes/random-image](https://random-image-pepebigotes.vercel.app/) ")
                    .multilineTextAlignment(.center)
                Text("Image downloading code from [Apple Developer Documents](https://developer.apple.com/documentation) modified with [Github Copilot](https://github.com/features/copilot)")
                    .multilineTextAlignment(.center)
                    


            }
            .navigationTitle("About")
        }
    }
}
#Preview {
    AboutView()
}
