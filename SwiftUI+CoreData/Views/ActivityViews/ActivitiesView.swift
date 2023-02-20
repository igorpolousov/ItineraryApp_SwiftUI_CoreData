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
    
    //var trip: TripModel?
    var title: String
    
    var body: some View {
        ZStack {
            Color(Theme.backgroundColor!)
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    Button(action: {
                        showingActionSheet.toggle()
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
                    .overCurrentContext(isPresented: $showingAddDayView, content: {
                        return AnyView (
                            AddDayView(onEnd: {
                                showingAddDayView.toggle()
                            })
                        )
                    })
                    .padding(), alignment: .bottomTrailing)
            
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
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(title)
                    .foregroundColor(Color(Theme.tintColor!))
                    .font(Font(Theme.mainFont!))
                    .shadow(color: .white, radius: 5, x: 3, y:  3)
            };
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("<")
                        .foregroundColor(Color(Theme.tintColor!))
                        .font(Font(Theme.backButtonFont!))
                        .shadow(color: .white, radius: 10,x: 3, y: 3).opacity(1.0)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

//struct Activities_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivitiesView(title: "hello")
//    }
//}
