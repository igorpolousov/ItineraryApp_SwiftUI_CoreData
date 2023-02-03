//
//  ActivityModel+CoreDataProperties.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//
//

import Foundation
import CoreData


extension ActivityModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ActivityModel> {
        return NSFetchRequest<ActivityModel>(entityName: "ActivityModel")
    }

    @NSManaged public var actitvityType: Int32
    @NSManaged public var id: UUID?
    @NSManaged public var subtitle: String?
    @NSManaged public var title: String?

}

extension ActivityModel : Identifiable {

}
