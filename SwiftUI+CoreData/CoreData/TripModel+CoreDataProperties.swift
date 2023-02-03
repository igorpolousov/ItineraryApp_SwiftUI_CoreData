//
//  TripModel+CoreDataProperties.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//
//

import Foundation
import CoreData


extension TripModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TripModel> {
        return NSFetchRequest<TripModel>(entityName: "TripModel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var image: Data?
    @NSManaged public var title: String

}

extension TripModel : Identifiable {

}
