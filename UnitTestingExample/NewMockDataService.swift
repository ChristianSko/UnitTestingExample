//
//  NewMockDataService.swift
//  UnitTestingExample
//
//  Created by Christian Skorobogatow on 14/8/22.
//

import SwiftUI
import Combine


protocol NewDataServiceProtocol {
    func downloadItemsWithEscaping(completion: @escaping(_ items: [String])-> ())
    func downloadItemWithCombine() -> AnyPublisher<[String], Error>
}

class NewMockDataService: NewDataServiceProtocol {
    
    let items: [String]
    
    init(items: [String]?) {
        self.items = items ?? [
        "One", "Two", "Three"
        ]
    }
    
    func downloadItemsWithEscaping(completion: @escaping(_ items: [String])-> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(self.items)
        }
    }
    
    func downloadItemWithCombine() -> AnyPublisher<[String], Error>{
        Just(items)
            .tryMap({ publishedItems in
                guard !publishedItems.isEmpty else {
                    throw URLError(.badServerResponse)
                }
                return publishedItems
            })
            .eraseToAnyPublisher()
    }
}
