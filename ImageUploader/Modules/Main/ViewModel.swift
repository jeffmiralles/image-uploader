//
//  ViewModel.swift
//  ImageUploader
//
//  Created by Jefferson Miralles on 10/22/21.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var pictures: [Picture] = []
    
    private let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol = DataService()) {
        self.dataService = dataService
    }
    
    
    /// Get the predefined Data from a Data Service
    /// - Returns: A Collection of data
    func getTags() -> [String] {
        return dataService.tags
    }
    
    /// Increases the number of picture object stored from memory
    func submitImage(_ picture: Picture) {
        self.pictures.append(picture)
    }
    
    ///  Checks if there is a picture stored
    func containPictures() -> Bool {
        return !pictures.isEmpty
    }
    
    /// Filter the stored Picture by the given tags
    /// - Parameters:
    ///   - tags: tags to filter
    func filterPictures(_ tags: [String]) -> [Picture] {
        if tags.isEmpty {
            return self.pictures
        }
        return self.pictures.filter { $0.tags.contains(tags) }
    }
    
}

public extension Sequence where Element : Hashable {
    func contains(_ elements: [Element]) -> Bool {
        return !Set(elements).isDisjoint(with: Set(self))
    }
}
