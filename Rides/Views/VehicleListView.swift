//
//  VehicleListView.swift
//  Rides
//
//  Created by Radhia MIGHRI on 29/9/2024.
//

import SwiftUI

struct VehicleListView: View {
    @ObservedObject var viewModel = VehicleViewModel()
    @State private var selectedSortingAttribute: SortMode = .vin
    
    @State private var numberOfVehiclesToFetch = ""
    @State private var showError = false
    @State private var errorMessage = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Input field and button
                HStack {
                    TextField("Enter number of vehicles", text: $numberOfVehiclesToFetch)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .padding(.leading)
                    
                    Button(action: {
                        // Validate input and attempt to fetch vehicles
                        if viewModel.validateInput(numberOfVehiclesToFetch) {
                            viewModel.fetchLimitedVehicles(numberOfVehiclesToFetch)
                            showError = false
                        } else {
                            showError = true
                            errorMessage = "Please enter a number between 0 and 100."
                        }
                    }) {
                        Text("Fetch")
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.trailing)
                }
                .padding()
                
                // Error message display
                if showError {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                // Segmented Control to switch sorting
                Picker("Sort by", selection: $selectedSortingAttribute) {
                    Text("VIN").tag(SortMode.vin)
                    Text("Car Type").tag(SortMode.carType)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .onChange(of: selectedSortingAttribute) { newValue in
                    viewModel.sortVehicles(by: newValue)
                }
                
                // List of Vehicles
                List(viewModel.sortedVehicles) { vehicle in
                    NavigationLink(destination: VehicleDetailView(vehicle: vehicle)) {
                        VStack(alignment: .leading) {
                            Text(vehicle.vin)
                                .font(.headline)
                            Text(vehicle.makeAndModel)
                                .font(.subheadline)
                        }
                    }
                }
                .navigationTitle("Vehicles")
            }
        }
    }

}
