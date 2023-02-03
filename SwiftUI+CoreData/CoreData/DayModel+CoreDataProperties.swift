//
//  DayModel+CoreDataProperties.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//
//

import Foundation
import CoreData


extension DayModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DayModel> {
        return NSFetchRequest<DayModel>(entityName: "DayModel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var subtitle: String?
    @NSManaged public var title: String?

}

extension DayModel : Identifiable {

}
