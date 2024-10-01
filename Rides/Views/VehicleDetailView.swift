//
//  VehicleDetailView.swift
//  Rides
//
//  Created by Radhia MIGHRI on 29/9/2024.
//

import SwiftUI

struct VehicleDetailView: View {
    var vehicle: Vehicle
    
    var body: some View {
        // TabView for sliding between pages
        TabView {
            // First View: Vehicle Details
            VehicleInfoView(vehicle: vehicle)
                .tabItem {
                    Text("Details")
                }

            // Second View: Estimated Carbon Emissions
            CarbonEmissionsView(vehicle: vehicle)
                .tabItem {
                    Text("Emissions")
                }
        }
        .tabViewStyle(PageTabViewStyle()) // Enables horizontal swipe
        .navigationTitle(vehicle.makeAndModel)
    }
}

struct VehicleInfoView: View {
    var vehicle: Vehicle
    
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

struct CarbonEmissionsView: View {
    var vehicle: Vehicle
    var viewModel = EmissionCarbonViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("kilometrage: \(vehicle.kilometrage) km")
                .font(.headline)
            Text("Estimated Carbon Emissions: \(viewModel.calculateCarbonEmissions(for: Double(vehicle.kilometrage)), specifier: "%.2f") units")
                .font(.subheadline)
        }
        .padding()
    }
}
