//
//  EstimatedCarbonTests.swift
//  RidesTests
//
//  Created by Radhia MIGHRI on 1/10/2024.
//

import XCTest
@testable import Rides

final class EstimatedCarbonTests: XCTestCase {

    var viewModel: EmissionCarbonViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = EmissionCarbonViewModel()
        
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

      // MARK: - Test Cases
    
    // Test for kilometrage less than 5000km
       func testCarbonEmissionsForKilometrageBelow5000() {
           let kilometrage = 3000.0
           let emissions = viewModel.calculateCarbonEmissions(for: kilometrage)
           XCTAssertEqual(emissions, 3000.0, "Emissions for 3000km should be 3000 units.")
       }
       
       // Test for exactly 5000km
       func testCarbonEmissionsForKilometrageExactly5000() {
           let kilometrage = 5000.0
           let emissions = viewModel.calculateCarbonEmissions(for: kilometrage)
           XCTAssertEqual(emissions, 5000.0, "Emissions for 5000km should be 5000 units.")
       }
       
       // Test for kilometrage greater than 5000km (e.g., 7000km)
       func testCarbonEmissionsForKilometrageAbove5000() {
           let kilometrage = 7000.0
           let emissions = viewModel.calculateCarbonEmissions(for: kilometrage)
           
           // Expected: 5000 * 1.0 + (2000 * 1.5) = 5000 + 3000 = 8000
           XCTAssertEqual(emissions, 8000.0, "Emissions for 7000km should be 8000 units.")
       }
       
       // Test for kilometrage of exactly 0km
       func testCarbonEmissionsForZeroKilometrage() {
           let kilometrage = 0.0
           let emissions = viewModel.calculateCarbonEmissions(for: kilometrage)
           XCTAssertEqual(emissions, 0.0, "Emissions for 0km should be 0 units.")
       }

}
