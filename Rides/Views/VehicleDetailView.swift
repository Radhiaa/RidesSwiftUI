//
//  VehicleDetailView.swift
//  Rides
//
//  Created by Radhia MIGHRI on 29/9/2024.
//

import SwiftUI

struct VehicleDetailView: View {
    let vehicle: Vehicle
    
    var body: some View {
        VStack(spacing: 20) {
            Text("VIN: \(vehicle.vin)")
                .font(.title)
                .padding(.top, 20)
            
            Text("Car Type: \(vehicle.carType)")
                .font(.headline)
            
            Text("Make And Model: \(vehicle.makeAndModel)")
                .font(.subheadline)
            
            Text("Color: \(vehicle.color)")
                .font(.subheadline)
            
            Spacer()
        }
        .navigationTitle("Vehicle Details")
        .padding()
    }
}
