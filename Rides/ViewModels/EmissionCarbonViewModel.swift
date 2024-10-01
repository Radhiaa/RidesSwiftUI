//
//  EmissionCarbonViewModel.swift
//  Rides
//
//  Created by Radhia MIGHRI on 1/10/2024.
//

import Foundation

class EmissionCarbonViewModel {
    
    // Function to calculate estimated carbon emissions
    func calculateCarbonEmissions(for kilometrage: Double) -> Double {
        if kilometrage <= 5000 {
            return kilometrage * 1.0 // 1 unit per km for the first 5000 km
        } else {
            return (5000 * 1.0) + ((kilometrage - 5000) * 1.5) // 1.5 units per km after 5000 km
        }
    }
}
