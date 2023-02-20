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
    
    @State var tripIndexToEdit: Int?
    
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
                                        .swipeActions(edge: .trailing) {
                                            Button(role: .destructive) {
                                                let index = tripsData.tripsData.firstIndex(of: trip)
                                                TripFunctions.deleteTrip(index: index!, coreDataStack: coreDataStack, completion: {tripsData.tripsData = TripsData.trips})
                                            } label: {
                                                HStack {
                                                    Image("delete").foregroundColor(.white)
                                                    Text("Delete")
                                                }
                                                
                                            }.tint(Color(Theme.tintColor!))
                                        }
                                        .swipeActions(edge: .leading) {
                                            Button {
                                                // Show "AddTripView" with "Edit trip" label
                                                showingAddTripView.toggle()
                                                // update trip in data store
                                                tripIndexToEdit = tripsData.tripsData.firstIndex(of: trip)
                                            } label: {
                                                HStack {
                                                    Image("pencil").foregroundColor(.white)
                                                    Text("Edit")
                                                }
                                            } .tint(Color(Theme.swipeEditColor!))
                                        }
                                }
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
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
                    .toolbarBackground(Color(uiColor: Theme.backgroundColor!), for: .navigationBar)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Trips")
                                .font(Font(Theme.mainFont!))
                                .foregroundColor(Color(Theme.tintColor!))
                                .shadow(color: .white, radius: 5, x: 3, y:  3)
                        }
                    }
                    
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
                                    AddTripView(coreDataStack: coreDataStack, tripsData: tripsData.tripsData, tripIndexToEdit: tripIndexToEdit, onEnd: { updateTripsData in
                                        tripsData.tripsData = updateTripsData
                                        showingAddTripView.toggle()
                                        tripIndexToEdit = nil
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
