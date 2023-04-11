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
    @EnvironmentObject var coreDataStack: CoreDataStack
    
    @State var actitvityToEdit: ActivityModel?
    var title: String
    var imageData: Data?
    var image: Image?
    var tripIndex: Int
    @State var dayIndex: Int?
    @State var activityIndexToEdit: Int?
    
    var body: some View {
        ZStack {
            // If exist trip image
            if let imageData {
                if let imageToLoad = UIImage(data: imageData) {
                    GeometryReader { proxy in
                        Image(uiImage: imageToLoad)
                            .resizable()
                            .opacity(0.45)
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
                if let dayModels = tripsData.tripsData[tripIndex].dayModels?.array as? [DayModel] {
                    ForEach(dayModels) { dayModel in
                        let dayIndex = tripsData.tripsData[tripIndex].dayModels?.index(of: dayModel)
                        Section(header: HeaderView(text: dayModel.title!.dateFormatter(), descriptionText: dayModel.subtitle!)) {
                            if let activities = dayModel.activityModels?.array as? [ActivityModel] {
                                ForEach(activities) { activity in
                                    ZStack {
                                        ActivityView(title: activity.title ?? "", subtitle: activity.subtitle ?? "", actitvityImage: setupImage(activityType: activity.actitvityType))
                                            .swipeActions(edge: .trailing,allowsFullSwipe: true ) {
                                                // delete code here
                                                Button(role: .destructive) {
                                                    ActivityFunctions.deleteActivity(at: tripIndex, for: dayIndex ?? 0, using: activity, coreDataStack: coreDataStack)
                                                } label: {
                                                    HStack {
                                                        Image("delete").foregroundColor(.white)
                                                        Text("Delete")
                                                    }
                                                }.tint(Color(Theme.tintColor!))

                                            }
                                            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                                // edit code here
                                                Button {
                                                    // Showing "Add activity view" with "Edit activity" label
                                                    withAnimation(.easeInOut(duration: 0.25)) {
                                                        showingAddActivityView.toggle()
                                                    }
                                                    let dayModel = tripsData.tripsData[tripIndex].dayModels?[dayIndex ?? 0] as! DayModel
                                                    let activityModels = dayModel.activityModels
                                                    activityIndexToEdit = activityModels?.index(of: activity)
                                                    actitvityToEdit = activity
                                                    self.dayIndex = dayIndex
                                                  
                                                } label: {
                                                    HStack {
                                                        Image("pencil").foregroundColor(.white)
                                                        Text("Edit")
                                                    }
                                                }.tint(Color(Theme.swipeEditColor!))
                                            }
                                    }
                                    .listRowSeparator(.hidden)
                                    .listRowBackground(Color.clear)
                                }
                            }
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            
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
                    .frame(width: 60, height: 60)
                    .padding(.trailing, 15)
                    
                    // Add Day or Activity action sheet
                    .confirmationDialog("What would you like to select?", isPresented: $showingActionSheet, titleVisibility: .automatic) {
                        Button("Add Day") {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                showingAddDayView.toggle()
                            }
                        }
                        
                        Button("Add Activity") {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                showingAddActivityView.toggle()
                            }
                        }
                        .disabled(tripsData.tripsData[tripIndex].dayModels?.count == 0)
                        
                        Button("Cancel", role: .cancel, action: {})

                    } message: {
                        Text("What would you like to select?")
                    }
                }
            }
            
            // Showing AddDayView
            if showingAddDayView {
                AddDayView(showingAddDayView: $showingAddDayView, tripIndex: tripIndex, onEnd: {})
            }

            // Showing AddActivityView
            if showingAddActivityView {
                if let dayModels = TripsData.trips[tripIndex].dayModels?.array as? [DayModel] {
                    let firstDate = dayModels.first?.title?.dateFormatter() ?? ""
                    AddActivityView(selectedDate: firstDate, showingAddActivityView: $showingAddActivityView,  activityToEdit: actitvityToEdit, tripIndex:tripIndex, dayIndex: dayIndex, activityIndex: activityIndexToEdit )
                }
            }
        }
        // Navigation bar setup
        .navigationBarBackButtonHidden(true)
        .toolbarBackground(Color(uiColor: Theme.backgroundColor!), for: .navigationBar)
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
    
    func setupImage(activityType: Int32) -> String {
        
        switch activityType {
        case 0:
            return "hotel"
        case 1:
            return "taxi"
        case 2:
            return "train"
        case 3:
            return "food"
        case 4:
            return "flight"
        default:
            return "hotel"
        }
    }
}

