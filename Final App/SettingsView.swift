//
//  SettingsView.swift
//  Final App
//
//  Created by Raphael Abano on 11/10/24.
//

import SwiftUI

struct SettingsView: View {
    @Binding var showSettings: Bool
    var body: some View {
        NavigationStack {
            HStack {
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done", action: {
                        showSettings.toggle()
                    })
                }
            }
        }
    }
}

#Preview {
    SettingsView(showSettings: .constant(true)) //Autocomplete gave me this so idk
}
