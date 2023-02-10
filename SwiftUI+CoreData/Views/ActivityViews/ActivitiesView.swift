//
//  ActivitiesView.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//

import SwiftUI

struct ActivitiesView: View {
    
    @State private var showingAddDayView = false
    @State private var showingAddActivityView = false
    @State private var showingActionSheet = false
    
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
                    })
                    .actionSheet(isPresented: $showingActionSheet, content: {
                        ActionSheet(title: Text("What would you like to select?"),
                                    buttons: [
                                        .default(Text("Add Day")) {
                                            showingAddDayView.toggle()
                                        },
                                        .default(Text("Add Activity")) {
                                            showingAddActivityView.toggle()
                                        }
                                    ])
                    })
            .overCurrentContext(isPresented: $showingAddActivityView, content: {
                return AnyView (
                    AddActivityView()
                )
            })
            .overCurrentContext(isPresented: $showingAddActivityView, content: {
                return AnyView (
                    AddDayView()
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
