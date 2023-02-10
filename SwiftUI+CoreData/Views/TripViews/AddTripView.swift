//
//  PopUpView.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 07.02.2023.
//

import SwiftUI
import CoreData

struct AddTripView: View {
    
    @State private var viewName = "Add Trip"
    @State private var tripName = ""
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var coreDataStack: CoreDataStack
    @State var mockTrips: [String]
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.45)
                .edgesIgnoringSafeArea(.all)
        
            ZStack() {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(Theme.backgroundColor!))
                    .modifier(AddViewsModifier(height: 200, bottomPadding: 330))
                
                image?
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .cornerRadius(10)
                    .padding(.bottom, 330)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                
                VStack{
                    
                    HStack {
                        Text(viewName)
                            .frame(width: 170)
                            .font(Font(Theme.mainFont!))
                            .shadow(color: .white, radius: 5, x: 3,y: 3)
                            .padding(.top, 30)
                        
                        Spacer()
                        
                        Button {
                            showingImagePicker = true
                        } label: {
                            Image("camera")
                                .tint(Color(Theme.tintColor!))
                                .frame(width: 50, height: 50)
                        }
                        .padding(.top, 30)
                        .padding(.trailing, 30)
                    }
                    
                    TextField(
                        "  Enter trip name",
                        text: $tripName)
                    .modifier(TextFieldModifier())
                    
                    HStack {
                        Button("Cancel") {
                            presentationMode.wrappedValue.dismiss()
                        }
                        .modifier(PopUpButton( cornerRadius: 10))
                        
                        Spacer()
                        
                        Button("Save") {
                            TripFunctions.createTrip(tripModelTitle: tripName, tripModelImage: inputImage, coreDataStack: coreDataStack)
                            mockTrips.append(tripName)
                            presentationMode.wrappedValue.dismiss()
                            print(mockTrips)
                        }
                        .modifier(PopUpButton(cornerRadius: 10))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    
                }
                .padding(.bottom, 340)
                .onChange(of: inputImage) { _ in
                    loadImage()
                }
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: $inputImage)
                }
                
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
}


struct AddTripPreview: PreviewProvider {
    static var previews: some View {
        AddTripView(coreDataStack: CoreDataStack(modelName: "SwiftUI+CoreData"), mockTrips: [])
    }
}
