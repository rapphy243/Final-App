//
//  ImageModel.swift
//  Final App
//
//  Created by Raphael Abano on 12/10/24.
//

import SwiftUI
import SwiftData

@Model
class SavedImage {
    var imageData: Data
    var timestamp: Date
    var isPreviousImage: Bool
    
    init(image: UIImage, isPrevious: Bool = false) {
        self.imageData = image.jpegData(compressionQuality: 1.0) ?? Data()
        self.timestamp = Date()
        self.isPreviousImage = isPrevious
    }
    
    var uiImage: UIImage? {
        UIImage(data: imageData)
    }
}
