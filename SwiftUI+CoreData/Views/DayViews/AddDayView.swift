//
//  AddDayView.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 06.02.2023.
//

import SwiftUI

// Here you can add Day to Trip

struct AddDayView: View {
    
    @State private var date = Date()
    @State private var dayDescription = ""
    
    @EnvironmentObject var coreDataStack: CoreDataStack
    @Binding var showingAddDayView: Bool
    var tripIndex: Int
    var onEnd: ()->()
    
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.45)
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(Theme.backgroundColor!))
                    .modifier(AddViewsModifier(height: 230, bottomPadding: 200))
                
                VStack {

                    Text("Add Day")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 40)
                        .padding(.leading, 30)
                        .font(Font(Theme.mainFont!))

                    DatePicker("Choose Date",selection: $date, displayedComponents: [.date])
                        .frame(width: 330, height: 40)
                        .font(Font(Theme.dayFont!))
                    
                    TextField("  Day description (Optional)", text: $dayDescription)
                        .frame(width: 330, height: 40)
                        .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    
                    HStack {
                        Button("Cancel") {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                showingAddDayView.toggle()
                            }
                            onEnd()
                        }
                        .modifier(PopUpButton( cornerRadius: 10))
                        
                        Spacer()
                        
                        Button("Save") {
                            // Update days in trip model
                            let dayModel = DayModel(context: coreDataStack.managedContext)
                            dayModel.title = date
                            dayModel.subtitle = dayDescription
                            dayModel.id = UUID()
                            DayFunctions.createDay(tripIndex: tripIndex, dayModel: dayModel, coreDataStack: coreDataStack)
                            withAnimation(.easeInOut(duration: 0.25)) {
                                showingAddDayView.toggle()
                            }
                            onEnd()
                        }
                        .modifier(PopUpButton(cornerRadius: 10))
                    }
                    .frame(width: 360)
                    .padding(.top, 10)
                    
                }
                .frame(width: 350,height: 250)
                .padding(.bottom, 190)
            }
        }
    }
}


//struct AddDayView_Preview: PreviewProvider {
//    static var previews: some View {
//        AddDayView(onEnd: {})
//    }
//}
