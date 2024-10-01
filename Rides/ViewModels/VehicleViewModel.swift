//
//  VehicleViewModel.swift
//  Rides
//
//  Created by Radhia MIGHRI on 29/9/2024.
//

import Foundation
import Combine

enum SortMode {
    case vin
    case carType
}

class VehicleViewModel: ObservableObject {
    
    @Published var vehicles: [Vehicle] = []
    @Published var sortedVehicles: [Vehicle] = [] // Sorted vehicles to display
    @Published var errorMessage: String? = nil
    @Published var sortMode: SortMode = .carType // Default sort mode
    
    private var cancellables = Set<AnyCancellable>()
    private let vehicleService = VehicleService()
    
    // Fetch vehicles from the API
    func fetchVehicles(size: Int) {
        vehicleService.fetchVehicles(size: size)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { [weak self] vehicles in
                self?.vehicles = vehicles
                self?.sortVehicles(by: .vin) // Sort vehicles when received
                
            }
            .store(in: &cancellables)
    }
    
    // Sort vehicles based on the selected mode
    func sortVehicles(by attribute: SortMode) {
        switch attribute {
        case .vin:
            sortedVehicles = vehicles.sorted { $0.vin.lowercased() < $1.vin.lowercased() }
        case .carType:
            sortedVehicles = vehicles.sorted { $0.carType.lowercased() < $1.carType.lowercased() }
            
        }
    }
    
    // Function to simulate fetching a limited number of vehicles based on the input
      func fetchLimitedVehicles(_ size: String) {
            guard let count = Int(size) else { return }
            fetchVehicles(size: count)
        }
    
    // Validate input to ensure it's a valid number and between 0 and 100
    func validateInput(_ input: String) -> Bool {
        guard let number = Int(input), number >= 0, number <= 100 else {
            return false
        }
        return true
    }
    
    func vin(at index: Int) -> String {
        return sortedVehicles[index].vin
    }
    
    func carType(at index: Int) -> String {
        return sortedVehicles[index].carType
    }
    
    func makeAndModel(at index: Int) -> String {
        return sortedVehicles[index].makeAndModel
    }
    func vehicle(at index: Int) -> Vehicle {
        return sortedVehicles[index]
    }
}
