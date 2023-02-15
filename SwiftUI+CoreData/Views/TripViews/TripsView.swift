//
//  ContentView.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//

import SwiftUI

struct TripsView: View {
    
    @State private var showingAddTripView = false
    private var coreDataStack = CoreDataStack(modelName: "SwiftUI+CoreData")
    
    @EnvironmentObject var mockTrips: TripsData
    
    var body: some View {
        ZStack {
            NavigationView{
                ZStack{
                    List (mockTrips.mockTrips, id: \.self) { item in
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
                            Button(action: {
                                showingAddTripView.toggle()
                            }, label: {
                                Text("+")
                                    .modifier(PlusButtonModifier())
                                
                            }).overCurrentContext(isPresented: $showingAddTripView, showWithAnimate: true, dismissWithAnimate: true, modalPresentationStyle: .crossDissolve, content: {
                                return AnyView (
                                    AddTripView(coreDataStack: coreDataStack, mockTrips: mockTrips.mockTrips, onEnd: {
                                        itemTrips in
                                        mockTrips.mockTrips = itemTrips
                                        showingAddTripView.toggle()
                                    }))
                            })
                            .frame(width: 60, height: 60)
                            .padding(.trailing, 10)
                        }
                    }
                }
            }
        }
    }
}

    
//    struct TripsView_Previews: PreviewProvider {
//        static var previews: some View {
//            TripsView()
//    }
//}
