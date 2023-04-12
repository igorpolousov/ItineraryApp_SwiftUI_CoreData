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
    @State private var showingAlert = false
    @State private var showingPhotoAccessAlert = false
    @StateObject var photoLibraryManager = PhotoLibraryManager()
    
    @EnvironmentObject var tripsData: TripsData
    @EnvironmentObject var coreDataStack: CoreDataStack
    
    @Binding var showingAddTripView: Bool
    @Binding var tripIndexToEdit: Int?
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.55)
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
                            showingAddTripView.toggle()
                        }
                        .modifier(PopUpButton( cornerRadius: 10))
                        
                        Spacer()
                        
                        Button("Save") {
                            if tripName == "" {
                                showingAlert.toggle()
                            } else {
                                if let tripIndexToEdit {
                                        TripFunctions.updateTrip(at: tripIndexToEdit, title: tripName, tripModelImage: inputImage, coreDataStack: coreDataStack)
                                } else {
                                    withAnimation(.easeInOut(duration: 0.25))  {
                                        TripFunctions.createTrip(tripModelTitle: tripName, tripModelImage: inputImage, coreDataStack: coreDataStack, completion: {
                                            tripsData.tripsData = TripsData.trips
                                        })
                                    }
                                }
                                withAnimation(.easeInOut(duration: 0.25)) {
                                    showingAddTripView.toggle()
                                }
                                tripIndexToEdit = nil
                            }
                        }
                        .modifier(PopUpButton(cornerRadius: 10))
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Better to have trip name"), message: Text("Enter trip name"), dismissButton: .cancel(Text("Got it")) )
                        }
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
                    if photoLibraryManager.photoLibraryPermissinGranted {
                        ImagePickerWithCrop(image: {image in
                            inputImage = image
                            showingImagePicker.toggle()
                        })
                    } else {
                        VStack {
                            Spacer()
                            Text("Access to photo library not granted")
                            
                                .cornerRadius(20)
                            Spacer()
                            Button("Provide accees to photo library") {
                                photoLibraryManager.photoLibraryPermissinGranted = true
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
        .onAppear{
            photoLibraryManager.requestPermission()
            if let index = tripIndexToEdit {
                viewName = "  Edit trip"
                let trip = tripsData.tripsData[index]
                tripName = trip.title
                guard let data = trip.image, let imageToEdit = UIImage(data: data) else {return}
                inputImage = imageToEdit
                image = Image(uiImage: imageToEdit)
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
}


