//
//  TripFunctions.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//

import UIKit
import CoreData

class TripFunctions {
    // create trip
    static func createTrip(tripModelTitle: String, tripModelImage: UIImage? = nil, coreDataStack: CoreDataStack) {
        let tripModel = TripModel(context: coreDataStack.managedContext)
        tripModel.title = tripModelTitle
        tripModel.image = tripModelImage?.pngData()
        tripModel.id = UUID()
        TripsData.trips.append(tripModel)
        coreDataStack.saveContext()
    }
    
    // read trip form core data
    static func readTrips() {
        
    }
    
    // get trip data by trip id
    static func readTrip() {
        
    }
    
    // update trip data
    static func updateTrip() {
        
    }
    
    // delete trip
    static func deleteTrip() {
        
    }
    
}
