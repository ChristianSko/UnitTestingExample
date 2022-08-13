//
//  ContentView.swift
//  UnitTestingExample
//
//  Created by Christian Skorobogatow on 13/8/22.
//

import SwiftUI

/*
 // 1. Unit Testts
 - Test the business logic of your app
 
 2. UI Tests
 - Test the UI of your app
 */

struct UnitTestingExampleView: View {
    
    @StateObject private var vm : UnitTestingViewModel
    
    init(isPemium: Bool) {
        _vm = StateObject(wrappedValue: UnitTestingViewModel(isPremium: isPemium))
    }
    
    var body: some View {
        Text(vm.isPremium.description)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UnitTestingExampleView(isPemium: true)
    }
}
