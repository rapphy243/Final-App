//
//  Settings.swift
//  Final App
//
//  Created by Raphael Abano on 11/12/24.
//

//https://www.hackingwithswift.com/quick-start/beginners/how-to-create-your-own-structs
import SwiftUI

struct Settings {
    var showSettings: Bool
    var url : URL
    
    // https://www.hackingwithswift.com/quick-start/beginners/how-to-create-custom-initializers
    init () {
        showSettings = false
        url = URL(string: "https://picsum.photos/1000")!
    }
}
