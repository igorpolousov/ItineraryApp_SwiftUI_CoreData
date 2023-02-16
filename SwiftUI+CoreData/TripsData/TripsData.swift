//
//  TripsData.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 08.02.2023.
//

import UIKit

class TripsData: ObservableObject {
    
    static var trips: [TripModel] = []
    @Published var tripsData: [TripModel] = []
}

