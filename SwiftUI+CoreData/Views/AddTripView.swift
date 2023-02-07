//
//  PopUpView.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 07.02.2023.
//

import SwiftUI

struct AddTripView: View {
    
    @State private var viewName = "Add Trip"
    @State private var tripName = ""
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .zIndex(0)
            
            ZStack() {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(Theme.backgroundColor!))
                    .frame(width: 350, height: 200)
                    .padding(.bottom, 250)
                    .shadow(color: Color.black, radius: 10, x: 3, y: 3)
                
                image?
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350, height: 200)
                    .cornerRadius(10)
                    .padding(.bottom, 250)
                
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
                    .frame(width: 330)
                    .frame(height: 40)
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    
                    HStack {
                        Button("Cancel") {
                            // here wil be Cancel action
                        }
                        .modifier(PopUpButton( cornerRadius: 10))
                        
                        Spacer()
                        
                        Button("Save") {
                            // Here will be save action
                        }
                        .modifier(PopUpButton(cornerRadius: 10))
                    }
                    .frame(width: 360)
                    
                }
                .padding(.bottom, 280)
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
        AddTripView()
    }
}
