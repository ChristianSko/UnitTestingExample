//
//  UnitiTestingViewModel.swift
//  UnitTestingExample
//
//  Created by Christian Skorobogatow on 13/8/22.
//

import SwiftUI

class UnitTestingViewModel: ObservableObject {
    
    @Published var isPremium: Bool
    @Published var dataArray: [String] = []
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
    
    func addItem(item: String) {
        guard !item.isEmpty else { return }
        
        self.dataArray.append(item)
    }
}
