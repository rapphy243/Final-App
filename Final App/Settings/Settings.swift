//
//  Settings.swift
//  Final App
//
//  Created by Raphael Abano on 11/12/24.
//

//https://www.hackingwithswift.com/quick-start/beginners/how-to-create-your-own-structs
import SwiftUI

struct Settings {
    //https://www.hackingwithswift.com/quick-start/beginners/how-to-store-and-find-data-in-dictionaries
    //All apis found from google search "Random Image API Free"
    let apiDict = [
        "Random Image API": URL(string: "https://random.imagecdn.app/1000/1000"), // Works on student wifi
        "Picsum": URL(string: "https://picsum.photos/1000"), // Doesn't work on student wifi
        "PepeBigotes/random-image": URL(string: "https://random-image-pepebigotes.vercel.app/api/random-image"), // Doesn't work on student wifi
        "Test Image": URL(string: "https://i.rap.ph/R_Monogram_Circle_1000px-beCVHbk5.png"), // Static Image for testing
        "Unsplash": URL(string: "https://api.unsplash.com/photos/?client_id=") // Requires API key
    ]
    var showSettings : Bool // Used to open and close sheet
    var url : URL // URL used to get random image
    var currAPI : String // Key for the current api
    //var resolution : Int
    //var unsplashAPIKey : String = ""
    
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-create-custom-initializers
    init () {
        showSettings = false
        currAPI = "Random Image API"
        url = apiDict[currAPI, default: URL(string: "https://i.rap.ph/R_Monogram_Circle_1000px-beCVHbk5.png")]!
    }
}
