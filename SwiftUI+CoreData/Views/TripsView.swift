//
//  ContentView.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//

import SwiftUI

struct TripsView: View {
    
    // Create Core Data stack
    let coreDataStack = CoreDataStack(modelName: "SwiftUI+CoreData")
    
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(Color(Theme.tintColor!))
                
            Text("Hello, world!")
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
                .font(Font(Theme.mainFont!))
                .foregroundColor(Color(Theme.tintColor!))
                .cornerRadius(10)
                .shadow(color: .green, radius: 3, x: 3, y: 3)

                
        }
        .padding()
        
        
    }
}

struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView()
    }
}
