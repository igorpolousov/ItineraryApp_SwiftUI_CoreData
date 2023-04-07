//
//  AddActivityView.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 06.02.2023.
//

import SwiftUI

struct AddActivityView: View {
    
    @State private var showingAlert =  false
    @State private var activityDescription: String = ""
    @State private var additionalDescription: String = ""
    @State var selectedDate: String = ""
    
    @Binding  var showingAddActivityView: Bool
    @EnvironmentObject var coreDataStack: CoreDataStack
    @EnvironmentObject var tripsData: TripsData
    
    @State private var hotelTapped: Bool = false
    @State private var taxiTapped: Bool = false
    @State private var trainTapped: Bool = false
    @State private var foodTapped: Bool = false
    @State private var flightTapped: Bool = false
    @State private var activityType: ActivityType = .hotel
   
    var tripIndex: Int
    //var dayIndex: Int = 0
    var onEnd: ()->()
    
    var body: some View {
        
        ZStack {
            Color.black
                .opacity(0.45)
                .edgesIgnoringSafeArea(.all)
          
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(Theme.backgroundColor!))
                .modifier(AddViewsModifier(height: 330, bottomPadding: 200))
            
            VStack {
                
                Text("Add Activity")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 40)
                    .padding(.leading, 30)
                    .font(Font(Theme.mainFont!))
                
                if let dayModels = TripsData.trips[tripIndex].dayModels?.array as? [DayModel] {
                    Picker("Choose date", selection: $selectedDate) {
                        ForEach(dayModels, id: \.self) { dayModel in
                            if let title = dayModel.title {
                                Text(title.dateFormatter()).tag(title)
                                    .font(Font(Theme.readFont!))
                            }
                        }
                    }
                    .frame(width: 330, height: 40)
                    .font(Font(Theme.dayFont!))
                    .tint(Color.black)
                }
                
                HStack(spacing: 20) {
                    Button {
                        changeButtonColor(button: &hotelTapped)
                        if hotelTapped == true {
                            activityType = ActivityType.hotel
                        }
                    } label: {
                        Image("hotel")
                            .foregroundColor(hotelTapped ? Color(Theme.tintColor!) : Color(Theme.accentColor!) )
                    }
                   
                    Button {
                      changeButtonColor(button: &taxiTapped)
                        if taxiTapped == true {
                            activityType = ActivityType.taxi
                        }
                    } label: {
                        Image("taxi")
                            .foregroundColor(taxiTapped ? Color(Theme.tintColor!) : Color(Theme.accentColor!))
                    }
                    
                    Button {
                      changeButtonColor(button: &trainTapped)
                        if trainTapped == true {
                            activityType = ActivityType.train
                        }
                    } label: {
                        Image("train")
                            .foregroundColor(trainTapped ? Color(Theme.tintColor!) : Color(Theme.accentColor!))
                    }
                    
                    Button {
                        changeButtonColor(button: &foodTapped)
                        if foodTapped == true {
                            activityType = ActivityType.food
                        }
                    } label: {
                        Image("food")
                            .foregroundColor(foodTapped ? Color(Theme.tintColor!) : Color(Theme.accentColor!))
                    }
                    
                    Button {
                        changeButtonColor(button: &flightTapped)
                        if flightTapped == true {
                            activityType = ActivityType.flight
                        }
                    } label: {
                        Image("flight")
                            .foregroundColor(flightTapped ? Color(Theme.tintColor!) : Color(Theme.accentColor!))
                    }
                }
                
                TextField("  Add Activity Description", text: $activityDescription)
                    .modifier(TextFieldModifier())
                
                TextField("  Add additional description (Optional)", text: $additionalDescription)
                    .modifier(TextFieldModifier())
                
                HStack {
                    Button("Cancel") {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            showingAddActivityView.toggle()
                        }
                        onEnd()
                    }
                    .modifier(PopUpButton( cornerRadius: 10))
                    
                    Spacer()
                    
                    Button("Save") {
                        // Update trip Activity
                        if activityDescription == "" {
                            showingAlert.toggle()
                        } else {
                            if let dayModels = TripsData.trips[tripIndex].dayModels?.array as? [DayModel] {
                                print(dayModels)
                                for dayModel in dayModels {
                                    if dayModel.title?.dateFormatter() == selectedDate {
                                        let dayIndex = dayModels.firstIndex(of: dayModel)!
                                        ActivityFunctions.createActivity(at: tripIndex, for: dayIndex, activityTitle: activityDescription, activitySubTitle: additionalDescription, activityType: activityType.rawValue, coreDataStack: coreDataStack)
                                    }
                                }
                            }
                            withAnimation(.easeInOut(duration: 0.25)) {
                                showingAddActivityView.toggle()
                            }
                        }
                       
                        onEnd()
                    }
                    .modifier(PopUpButton(cornerRadius: 10))
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Better to have activity name"), message: Text("Enter Activity name"), dismissButton: .cancel(Text("Got it")) )
                    }
                }
                .frame(width: 360)
            }
            .padding(.bottom, 190)
            
        }
    }
    
    func changeButtonColor( button: inout Bool) {
        hotelTapped = false
        taxiTapped = false
        foodTapped = false
        flightTapped = false
        trainTapped = false
        button = true
    }
}





