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
    //All don't use API kets because i don't want to bake in API keys atm
    let apiDict = [
        "Picsum": URL(string: "https://picsum.photos/1000"),
        "PepeBigotes/random-image": URL(string: "https://random-image-pepebigotes.vercel.app/api/random-image"),
        "Random Image API": URL(string: "https://random.imagecdn.app/1000/1000"),
        "Test": URL(string: "https://i.rap.ph/R_Monogram_Circle_1000px-beCVHbk5.png") // Only for testing
    ]
    var showSettings : Bool // Used to open and close sheet
    var url : URL // URL used to get random image
    var currAPI : String // Key of what 
    var resolution : Int
    
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-create-custom-initializers
    init () {
        showSettings = false
        resolution = 1000 // Can be used for Picsum aand Random Image API
        currAPI = "Picsum"
        url = apiDict["Picsum", default: URL(string: "https://i.rap.ph/R_Monogram_Circle_1000px-beCVHbk5.png")]!
    }
}
