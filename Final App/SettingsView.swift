//
//  SettingsView.swift
//  Final App
//
//  Created by Raphael Abano on 11/10/24.
//

import SwiftUI

struct SettingsView: View {
    @Binding var settings: Settings
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Change API")
                        .padding()
                    //https://www.hackingwithswift.com/quick-start/swiftui/how-to-let-users-pick-options-from-a-menu
                    //The picker contains a list of all keys in apiDict
                    Picker("API", selection: $settings.url) {
                        ForEach(settings.apiDict.keys.sorted(), id: \.self) { key in
                            Text(key)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    }
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done", action: {
                        settings.showSettings.toggle()
                    })
                }
            }
        }
    func changeAPI(url : String) -> Void {
        settings.url = URL(string: url)!
    }
}

#Preview {
    @Previewable @State var settings = Settings() // Github Copolot Prompt "How do I fix 'Cannot convert value of type 'Settings' to expected argument type 'Binding'' with code"
    SettingsView(settings: $settings)
}
