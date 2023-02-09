//
//  SwiftUI_CoreDataApp.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//

import SwiftUI

@main
struct SwiftUI_CoreDataApp: App {
    
    // Create Core Data stack
    let coreDataStack = CoreDataStack(modelName: "SwiftUI+CoreData")
  
    var body: some Scene {
        WindowGroup {
           TripsView()
            //ActivitiesView()
           
        }
    }
}
