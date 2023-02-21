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
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var tripsData: TripsData
    
    var title: String
    var imageData: Data?
    var image: Image?
    
    var body: some View {
        ZStack {
            // If exit trip image
            if let imageData {
                if let imageToLoad = UIImage(data: imageData) {
                    GeometryReader { proxy in
                        Image(uiImage: imageToLoad)
                            .resizable()
                            .aspectRatio(CGSize(width: proxy.size.width , height: proxy.size.height), contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                    }
                }
            } else {
                // If trip hasn't image
                Color(Theme.backgroundColor!)
                    .edgesIgnoringSafeArea(.all)
            }
            
            // List of Days with Activities
            List {
                ForEach(tripsData.tripsData) { trip in
                    Section {
                        Text(trip.title)
                    }
                }
            }
            
            // Floating action button
            VStack {
               Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        showingActionSheet.toggle()
                    }, label: {
                        Text("+")
                            .modifier(PlusButtonModifier())
                    })
                    // Add Day or Activity action sheet
                    .actionSheet(isPresented: $showingActionSheet, content: {
                        ActionSheet(title: Text("What would you like to select?"),
                                    buttons: [
                                        .default(Text("Add Day")) {
                                            showingAddDayView.toggle()
                                        },
                                        .default(Text("Add Activity")) {
                                            showingAddActivityView.toggle()
                                        },
                                        .cancel()
                                    ])
                    })
                    // Showing AddDayView
                    .overCurrentContext(isPresented: $showingAddDayView, content: {
                        return AnyView (
                            AddDayView(onEnd: {
                                showingAddDayView.toggle()
                            })
                        )
                    })
                    .frame(width: 60, height: 60)
                    .padding(.trailing, 20)
                }
            }

            // Showing AddActivityView
            if showingAddActivityView {
                ZStack {
                }
                .overCurrentContext(isPresented: $showingAddActivityView, content: {
                    return AnyView (
                        AddActivityView(onEnd: {
                            showingAddActivityView.toggle()
                        })
                    )
                })
            }
        }
        // Navigation bar setup
        .navigationBarBackButtonHidden(true)
        .toolbar {
            // Navigation bar title
            ToolbarItem(placement: .principal) {
                Text(title)
                    .foregroundColor(Color(Theme.tintColor!))
                    .font(Font(Theme.mainFont!))
                    .shadow(color: .white, radius: 5, x: 3, y:  3)
            };
            // Navigation bar back button
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("backArrow")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(Theme.tintColor!))
                        // Alternative button with text implementation
//                    Text("<")
//                        .foregroundColor(Color(Theme.tintColor!))
//                        .font(Font(Theme.backButtonFont!))
//                        .shadow(color: .white, radius: 10,x: 3, y: 3).opacity(1.0)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

