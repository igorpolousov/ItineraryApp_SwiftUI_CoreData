//
//  PopUpView.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 06.02.2023.
//

import SwiftUI

// Prototype for Add... views
struct PopUpView1: View {
    
    @State private var tripName: String = ""
    @State private var viewName: String = "Add trip"
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        
        ZStack {
            
            Color.gray
                .edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.bottom)
                .opacity(0.6)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(Theme.backgroundColor!))
                .frame(width: 350, height: 225)
                .padding(.bottom, 250)
                .zIndex(-1)
                .shadow(color: Color.black, radius: 10, x: 3, y: 3)
            
            image?
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 225)
                .cornerRadius(10)
                .padding(.bottom, 250)
            
            // HStack(View name + select image button) + Textfield + HStack( Save + Cancel buttons)
            VStack(alignment: .leading) {
                HStack { // View name + select image button
                    // View name
                    Text(viewName)
                        .frame(width: 150)
                        .font(Font(Theme.mainFont!))
                        .shadow(color: .white, radius: 5, x: 3,y: 3)
                        .padding(.top, 30)
                    
                    Spacer()
                    // Select image button
                    Button {
                        showingImagePicker = true
                    } label: {
                        Image("camera")
                            .tint(Color(Theme.tintColor!))
                            .frame(width: 50, height: 50)
                    }
                    
                    .padding(.top, 30)
                    .padding(.trailing, 10)
                  
                }
                
                TextField(
                    "  Enter trip name",
                    text: $tripName)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .padding(.top, 10)
                
                Spacer()
                
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
            }
            .frame(width: 350, height: 225)

            .padding(.bottom, 260)
            .onChange(of: inputImage) { _ in
                loadImage()
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
}


struct PopUpPreview1: PreviewProvider {
    
    static var previews: some View {
        PopUpView1()
    }
}
