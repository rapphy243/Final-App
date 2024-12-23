//
//  Settings.swift
//  Final App
//
//  Created by Raphael Abano on 11/12/24.
//

// https://www.hackingwithswift.com/quick-start/beginners/how-to-create-your-own-structs

import SwiftUI

struct Settings {
    // All APIs were found from Google "Random Image API Free"
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-store-and-find-data-in-dictionaries
    let apiDict = [
        "Random Image API": URL(string: "https://random.imagecdn.app/1000/1000"), // Works on student wifi
        "Daniel Petrica": URL(string: "https://random.danielpetrica.com/api/random?format=regular"), // Works on student wifi
        "Picsum": URL(string: "https://picsum.photos/1000"), // Doesn't work on student wifi
        "PepeBigotes/random-image": URL(string: "https://random-image-pepebigotes.vercel.app/api/random-image"), // Doesn't work on student wifi
        "Static Image": URL(string: "https://i.rap.ph/R_Monogram_Circle_1000px-beCVHbk5.png"), // Static Image for testing
    ]
    var showSettings : Bool // Used to open and close settings sheet
    var url : URL // URL used to get random image
    var currAPI : String // Key for the current api
    var resolution : Int // Used for Picsum and Random Image API
    
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-create-custom-initializers
    init() {
        let defaults = UserDefaults.standard // https://www.hackingwithswift.com/example-code/system/how-to-save-user-settings-using-userdefaults
        showSettings = false
        resolution = 1000
        if defaults.string(forKey: "currAPI") != nil {
            currAPI = defaults.string(forKey: "currAPI")!
        }
        else {
            currAPI = "Daniel Petrica"
            defaults.set(currAPI, forKey: "currAPI")
        }
        if defaults.url(forKey: "url") != nil {
            url = defaults.url(forKey: "url")!
        }
        else {
            url = apiDict[currAPI, default: URL(string: "https://i.rap.ph/R_Monogram_Circle_1000px-beCVHbk5.png")]!
            defaults.set(url, forKey: "url")
        }
    }
}
