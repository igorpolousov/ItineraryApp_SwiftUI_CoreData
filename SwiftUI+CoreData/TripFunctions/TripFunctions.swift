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
    static func createTrip(tripModelTitle: String, tripModelImage: UIImage? = nil, coreDataStack: CoreDataStack, completion: @escaping ()->()) {
        let tripModel = TripModel(context: coreDataStack.managedContext)
        tripModel.title = tripModelTitle
        tripModel.image = tripModelImage?.pngData()
        tripModel.id = UUID()
        TripsData.trips.append(tripModel)
        completion()
        coreDataStack.saveContext()
    }
    
    // read trip form core data
    static func readTrips(coreDataStack: CoreDataStack, completion: @escaping ()->()) {
        let fetchRequest: NSFetchRequest<TripModel> = TripModel.fetchRequest()
        var asyncFetchRequest: NSAsynchronousFetchRequest<TripModel>?
        asyncFetchRequest = NSAsynchronousFetchRequest<TripModel>(fetchRequest: fetchRequest) {
            (result: NSAsynchronousFetchResult) in
            guard let tripData = result.finalResult else {return}
            TripsData.trips = tripData
            completion()
        }
        
        do {
            guard let asyncFetchRequest = asyncFetchRequest else {return}
            try coreDataStack.managedContext.execute(asyncFetchRequest)
        } catch let error as NSError {
            print("Unalble to load data \(error), \(error.localizedDescription)")
        }
    }
    
    // get trip data by trip id
    static func readTrip() {
        
    }
    
    // update trip data
    static func updateTrip(at index: Int, title: String, tripModelImage: UIImage? = nil, coreDataStack: CoreDataStack, completion: @escaping ()->()) {
        TripsData.trips[index].title = title
        TripsData.trips[index].image = tripModelImage?.pngData()
        coreDataStack.saveContext()
        completion()
        
    }
    
    // delete trip
    static func deleteTrip(index: Int, coreDataStack: CoreDataStack, completion: @escaping ()->()) {
        let tripToRemove = TripsData.trips[index]
        coreDataStack.managedContext.delete(tripToRemove)
        coreDataStack.saveContext()
        TripsData.trips.remove(at: index)
        completion()
    }
    
}
