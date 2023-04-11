//
//  ActivityFunctions.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//

import UIKit

class ActivityFunctions {
    // create activity
    static func createActivity(at tripIndex: Int, for dayIndex: Int, activityTitle: String, activitySubTitle: String, activityType: Int32, coreDataStack: CoreDataStack, activityIndex: Int? = nil) {
        let activityModel = ActivityModel(context: coreDataStack.managedContext)
        activityModel.title = activityTitle
        activityModel.subtitle = activitySubTitle
        activityModel.actitvityType = activityType
        activityModel.id = UUID()
        let dayModel = TripsData.trips[tripIndex].dayModels?[dayIndex] as? DayModel
        if activityIndex != nil {
            dayModel?.insertIntoActivityModels(activityModel, at: activityIndex ?? 0)
        } else {
            dayModel?.addToActivityModels(activityModel)
        }
        coreDataStack.saveContext()
        
    }
    
    // delete activity
    static func deleteActivity(at tripIndex: Int, for dayIndex: Int, using activityModel: ActivityModel, coreDataStack: CoreDataStack) {
        let dayModel = TripsData.trips[tripIndex].dayModels?[dayIndex] as? DayModel
        dayModel?.removeFromActivityModels(activityModel)
        coreDataStack.saveContext()
    }
    
    // update activity
    static func updateActivity(at tripIndex: Int, for dayIndex: Int, activityIndex: Int, using activityModel: ActivityModel, coreDataStack: CoreDataStack) {
        let dayModel = TripsData.trips[tripIndex].dayModels?[dayIndex] as? DayModel
        dayModel?.removeFromActivityModels(at: activityIndex)
        createActivity(at: tripIndex, for: dayIndex, activityTitle: activityModel.title ?? "", activitySubTitle: activityModel.subtitle ?? "", activityType: activityModel.actitvityType, coreDataStack: coreDataStack,activityIndex: activityIndex)
        coreDataStack.saveContext()
        
    }
    
  
    
    // reorder activity
    static func reorderActivity(tripIndex: Int, oldDayIndex: Int, newDayIndex: Int, newActivityIndex: Int, activityModel: ActivityModel, coreDataStack: CoreDataStack) {
        
    }
}
