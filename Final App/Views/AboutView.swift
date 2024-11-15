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
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    .padding()
                    VStack {
                        Text("Random Image Generator")
                            .multilineTextAlignment(.center)
                            .font(.title)
                            .bold()
                        Text("Version 1.0")
                            .font(.subheadline)
                        Text("By: Rapphy243")
                            .bold()
                    }

                }
            }
        }
    }
}
#Preview {
    AboutView()
}
