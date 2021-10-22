//
//  DataService.swift
//  ImageUploader
//
//  Created by Jefferson Miralles on 10/22/21.
//

import Foundation

protocol DataServiceProtocol {
    var tags: [String] { get }
}

class DataService: DataServiceProtocol {
    var tags: [String] {
        ["Nature", "Sunset", "Sports"]
    }
    
}
