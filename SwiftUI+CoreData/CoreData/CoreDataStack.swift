//
//  CoreDataStack.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//

import UIKit
import CoreData

class CoreDataStack {
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { stroreDescription, error in
            if let error = error as NSError? {
                print("ERROR TO LOAD STORES \(error), \(error.localizedDescription)")
            }
        }
        return container
    }()
    
  lazy var managedContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()
     
    
    func saveContext() {
        guard managedContext.hasChanges else {return}
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("CAN'T SAVE CONTEXT \(error), \(error.localizedDescription)")
        }
    }
    
}
