//
//  DayFunctions.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//

import UIKit

class DayFunctions {
    
    // create day function
    static func createDay(tripIndex: Int, dayModel: DayModel, coreDataStack: CoreDataStack) {
        TripsData.trips[tripIndex].addToDayModels(dayModel)
        guard let sortedDays = TripsData.trips[tripIndex].dayModels?.sorted(by: { dayModel1, dayModel2 in
            let dayModel1 = dayModel1 as? DayModel
            let dayModel2 = dayModel2 as? DayModel
            return (dayModel1?.title)! < (dayModel2?.title)!
        }) else {return}
        TripsData.trips[tripIndex].dayModels = NSOrderedSet(array: sortedDays)
        coreDataStack.saveContext()
    }
}
