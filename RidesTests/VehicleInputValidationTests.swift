//
//  VehicleInputValidationTests.swift
//  RidesTests
//
//  Created by Radhia MIGHRI on 1/10/2024.
//

import XCTest
@testable import Rides

final class VehicleInputValidationTests: XCTestCase {
    var viewModel: VehicleViewModel!
    
    override func setUpWithError() throws {
        viewModel = VehicleViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    // Test valid input within range
    func testValidInput() {
        let input = "50"
        let isValid = viewModel.validateInput(input)
        XCTAssertTrue(isValid, "Expected input '50' to be valid.")
    }
    
    // Test invalid input below range
    func testInputBelowZeroIsInvalid() {
        let input = "-1"
        let isValid = viewModel.validateInput(input)
        XCTAssertFalse(isValid, "Expected input '-1' to be invalid.")
    }
    
    // Test invalid input above range
    func testInputAboveHundredIsInvalid() {
        let input = "101"
        let isValid = viewModel.validateInput(input)
        XCTAssertFalse(isValid, "Expected input '101' to be invalid.")
    }
    
    // Test non-numeric input
    func testNonNumericInputIsInvalid() {
        let input = "abc"
        let isValid = viewModel.validateInput(input)
        XCTAssertFalse(isValid, "Expected input 'abc' to be invalid.")
    }
}
