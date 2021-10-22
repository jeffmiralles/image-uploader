//
//  Picture.swift
//  ImageUploader
//
//  Created by Jefferson Miralles on 10/22/21.
//

import Foundation
import UIKit

struct Picture: Identifiable, Hashable {
    let id: UUID = UUID()
    let image: UIImage
    let tags: [String]
    
    init(image: UIImage, tags: [String] = []) {
        self.image = image
        self.tags = tags
    }
}
