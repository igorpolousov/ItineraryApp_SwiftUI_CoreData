//
//  ActivitiesView.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//

import SwiftUI

struct ActivitiesView: View {
    
    @State private var showingAddActivityView = false
    
    //var trip: TripModel?
    var title: String
    
    var body: some View {
        ZStack {
            Color(Theme.backgroundColor!)
                .edgesIgnoringSafeArea(.all)
                .overlay(
            Button(action: {
                showingAddActivityView.toggle()
            }, label: {
                Text("+")
                    .modifier(PlusButtonModifier())
            }).overCurrentContext(isPresented: $showingAddActivityView, content: {
                return AnyView (
                    AddActivityView()
                )
            })
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
