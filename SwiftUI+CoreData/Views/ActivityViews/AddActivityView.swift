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
    @Environment(\.presentationMode) var presentationMode
    var onEnd: ()->()
    
    @State private var selectedDate: String = Date().dateFormatter()
    @State private var pickerMockData = [Date().dateFormatter(), Date().add(days: 1).dateFormatter(), Date().add(days: 2).dateFormatter(), Date().add(days: 3).dateFormatter()]
    
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
                
                
                Picker("Choose date", selection: $selectedDate) {
                    ForEach(pickerMockData, id: \.self) { date in
                        Text("\(date)")
                            .font(Font(Theme.readFont!))
                    }
                }
                .frame(width: 330, height: 40)
                .font(Font(Theme.dayFont!))
                .tint(Color.black)
                
                
                HStack(spacing: 20) {
                    Image("hotel")
                        .foregroundColor(Color(Theme.accentColor!))
                    Image("taxi")
                        .foregroundColor(Color(Theme.accentColor!))
                    Image("train")
                        .foregroundColor(Color(Theme.accentColor!))
                    Image("food")
                        .foregroundColor(Color(Theme.accentColor!))
                    Image("flight")
                        .foregroundColor(Color(Theme.accentColor!))
                }
                
                
                TextField("  Add Activity Description", text: $activityDescription)
                    .modifier(TextFieldModifier())
                
                TextField("  Add additional description (Optional)", text: $additionalDescription)
                    .modifier(TextFieldModifier())
                
                HStack {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                        onEnd()
                    }
                    .modifier(PopUpButton( cornerRadius: 10))
                    
                    Spacer()
                    
                    Button("Save") {
                        // Update trip Activity
                        if activityDescription == "" {
                            showingAlert.toggle()
                        } else {
                            presentationMode.wrappedValue.dismiss()
                            onEnd()
                        }
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
}

struct AddActivityView_Preview: PreviewProvider {
    static var previews: some View {
        AddActivityView(onEnd: {})
    }
}




