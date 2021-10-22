//
//  MockDataService.swift
//  ImageUploaderTests
//
//  Created by Jefferson Miralles on 10/22/21.
//

import Foundation
@testable import ImageUploader

class MockDataService: DataServiceProtocol {
    var tags: [String] {
        ["Nature", "Sunset", "Sports", "Adventure", "Cosmos"]
    }
}
