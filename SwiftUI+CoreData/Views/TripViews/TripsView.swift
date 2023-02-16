//
//  ContentView.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//

import SwiftUI

struct TripsView: View {
    
    @State private var showingAddTripView = false
    @EnvironmentObject var coreDataStack: CoreDataStack
    @EnvironmentObject var tripsData: TripsData
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack{
                    List {
                        ForEach(tripsData.tripsData) { trip in
                            ZStack {
                                NavigationLink(destination: ActivitiesView(title: trip.title)) {}
                                    .buttonStyle(.plain)
                                    .opacity(0.0)
                                    .frame(height: 0)
                                HStack {
                                    CustomRow(content: trip.title)
                                }
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                        }
                        .onDelete { indexSet in
                            TripFunctions.deleteTrip(indexSet: indexSet, coreDataStack: coreDataStack, completion: {
                                tripsData.tripsData = TripsData.trips
                            })
                        }
                    }
                    .onAppear{
                        TripFunctions.readTrips(coreDataStack: coreDataStack, completion: {
                            tripsData.tripsData = TripsData.trips
                        })
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
                                    AddTripView(coreDataStack: coreDataStack, tripsData: tripsData.tripsData, onEnd: { updateTripsData in
                                        tripsData.tripsData = updateTripsData
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
