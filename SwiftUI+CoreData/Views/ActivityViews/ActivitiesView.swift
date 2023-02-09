//
//  ActivitiesView.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//

import SwiftUI

struct ActivitiesView: View {
    
    //var trip: TripModel?
    var title: String
    
    var body: some View {
        ZStack {
            Color(Theme.backgroundColor!)
                .edgesIgnoringSafeArea(.all)
                .overlay(
            Button {
                // Code here
            } label: {
                Image("plus")
                    
                    .modifier(PlusButtonModifier())
            }
                .padding(), alignment: .bottomTrailing)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Activities_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView(title: "hello")
    }
}
