//
//  SettingsView.swift
//  Final App
//
//  Created by Raphael Abano on 11/10/24.
//
//https://medium.com/@sharma17krups/swiftui-form-tutorial-how-to-create-settings-screen-using-form-part-1-8e8e80cf584e
import SwiftUI

struct SettingsView: View {
    @Binding var settings: Settings
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("API"), content: {
                    HStack {
                        Text("Current API")
                            Spacer()
                        //https://www.hackingwithswift.com/quick-start/swiftui/how-to-let-users-pick-options-from-a-menu
                        //The menu contains of all keys in settings.apiDict
                        //Also used Copilot to debug this "I am having problems making a list of each key in settings.apiDict which is a dictionary"
                        Menu(content: {
                            ForEach(Array(settings.apiDict.keys), id: \.self) { key in
                                Button(key) {
                                    settings.url = settings.apiDict[key, default: URL(string: "https://i.rap.ph/R_Monogram_Circle_1000px-beCVHbk5.png")]!
                                    settings.currAPI = key
                                }
                            }
                        }, label: {
                            Text(settings.currAPI)
                        })
                    }
//                    if settings.currAPI == ("Picsum") {
//                        HStack {
//                            Text("Resolution")
//                            Spacer()
//                            //https://www.hackingwithswift.com/quick-start/swiftui/how-to-format-a-textfield-for-numbers
//                            Stepper(label: {
//                                Text("\(settings.resolution)")
//                            })
//                        }
//                    }
//                    else {
//                        
//                    }
                })
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
    }
}

#Preview {
    @Previewable @State var settings = Settings() // Github Copolot Prompt "How do I fix 'Cannot convert value of type 'Settings' to expected argument type 'Binding'' with code"
    SettingsView(settings: $settings)
}
