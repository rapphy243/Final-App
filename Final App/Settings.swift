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
    let apiDict = [
        "Picsum": URL(string: "https://picsum.photos/1000"), //I LOVE dictionaries
        "Test": URL(string: "https://i.rap.ph/R_Monogram_Circle_1000px-beCVHbk5.png") //Testing
        
    ] //.keys returns a array of the keys in the dict
    var showSettings : Bool //Used to open and close sheet
    var showAbout : Bool // Used to show about in sheet
    var url : URL // URL used to get random image
    
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-create-custom-initializers
    init () {
        showSettings = false
        showAbout = false
        url = apiDict["Picsum", default: URL(string: "https://i.rap.ph/R_Monogram_Circle_1000px-beCVHbk5.png")]!
    }
}
