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
        
        ZStack {
            Color(Theme.backgroundColor!)
                .edgesIgnoringSafeArea(.all)
            
            Button {
                // Button code
            } label: {
                Image("plus")
                    .tint(Color.white)
                    .modifier(PlusButton())
                    .padding(.top, 680)
                    .padding(.leading, 280)
            }

            
        }
        
        
    }
}

struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView()
    }
}
