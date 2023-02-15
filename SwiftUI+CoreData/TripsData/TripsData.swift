//
//  TripsData.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 08.02.2023.
//

import UIKit

class TripsData: ObservableObject {
    
    static var trips: [TripModel] = []
    @Published var mockTrips: [String] = ["Trip 1", "Trip 2", "Trip 3"," Trip 4", " Trip 5"]

}

