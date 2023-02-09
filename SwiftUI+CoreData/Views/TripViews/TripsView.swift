//
//  ContentView.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//

import SwiftUI

struct TripsView: View {
    
    var mockTrips: [String] = ["Trip 1", "Trip 2", "Trip 3"," Trip 4", " Trip 5"," Trip 5"," Trip 5"," Trip 5"," Trip 5"]
    
    @State private var showingAddTripView = false
    private var coreDataStack = CoreDataStack(modelName: "SwiftUI+CoreData")
    
    var body: some View {
        ZStack {
            NavigationView{
                ZStack{
                    List (mockTrips, id: \.self) { item in
                        ZStack {
                            NavigationLink(destination: ActivitiesView(title: item)) {}.buttonStyle(.plain)
                                .opacity(0.0)
                                .frame(height: 0)
                            
                            HStack{
                                CustomRow(content: item)
                            }
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.grouped)
                    .scrollContentBackground(.hidden)
                    .background(Color(Theme.backgroundColor!))
                    .navigationTitle("Trips")
                    .toolbarBackground(Color(uiColor: Theme.swipeEditColor!), for: .navigationBar)
                    
                    VStack{
                        Spacer()
                        HStack {
                            Spacer()
                            Button {
                                showingAddTripView.toggle()
                            } label: {
                                Text("+")
                                    .modifier(PlusButtonModifier())
                                
                            }
                            .frame(width: 60, height: 60)
                            .padding(.trailing, 20)
                        }
                    }
                }
            }
            .sheet(isPresented: $showingAddTripView) {
                AddTripView(coreDataStack: coreDataStack, mockTrips: mockTrips)
            }
        }
    }
}

    
    struct TripsView_Previews: PreviewProvider {
        static var previews: some View {
            TripsView()
    }
}
