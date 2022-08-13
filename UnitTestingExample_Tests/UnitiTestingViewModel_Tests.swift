//
//  UnitiTestingViewModel_Tests.swift
//  UnitTestingExample_Tests
//
//  Created by Christian Skorobogatow on 13/8/22.
//

import XCTest
@testable import UnitTestingExample

// Naming Structure: test: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test: test_[struct or class]]_[variable or function]]_[expected result]

// Testing Structure: Given, When, Then

class UnitiTestingViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_UnitTestingViewModel_isPremium_shouldBeTrue() {
        // Given
        let userIsPremium: Bool = true
        
        // When
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssert(vm.isPremium)
    }
    
    func test_UnitTestingViewModel_isPremium_shouldBeFalse() {
        // Given
        let userIsPremium: Bool = false
        
        // When
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertFalse(vm.isPremium)
    }
    
    func test_UnitTestingViewModel_isPremium_shouldBeInjectedValue() {
        // Given
        let userIsPremium: Bool = Bool.random()
        
        // When
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertEqual(vm.isPremium, userIsPremium)
    }
    
    func test_UnitTestingViewModel_isPremium_shouldBeInjectedValue_stress() {
        for _ in 0..<10 {
            // Given
            let userIsPremium: Bool = Bool.random()
            
            // When
            let vm = UnitTestingViewModel(isPremium: userIsPremium)
            
            // Then
            XCTAssertEqual(vm.isPremium, userIsPremium)
        }
    }
    
    func test_UnitTestingViewModel_dataArray_shouldBeEmpty() {
        // Given
        
        // When
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
        
    }
    
    func test_UnitTestingViewModel_dataArray_shouldAdditems() {
        // Given
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        // When
        vm.addItem(item: "hello")
        
        // Then
        XCTAssertFalse(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 1)
        XCTAssertNotEqual(vm.dataArray.count, 0)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
        
    }
    
    func test_UnitTestingViewModel_dataArray_shouldNotAddBlankString() {
        // Given
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        // When
        vm.addItem(item: "")
        
        // Then
        XCTAssert(vm.dataArray.isEmpty)
    }
    
}
