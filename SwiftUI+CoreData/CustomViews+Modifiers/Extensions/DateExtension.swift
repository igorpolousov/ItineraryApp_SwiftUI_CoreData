//
//  DateExtension.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 08.02.2023.
//

import UIKit

extension Date {
    
    // For creating mock data - adds number of days to current date
    func add(days: Int) -> Date {
        return Calendar.current.date(byAdding: .day,value: days, to: Date())!
    }
    
    func dateFormatter() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: self)
    }
}
