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
    var imageData: Data?
    var image: Image?
    
    var body: some View {
        ZStack {
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
                Color(Theme.backgroundColor!)
                    .edgesIgnoringSafeArea(.all)
            }
            
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
                    .frame(width: 60, height: 60)
                    .padding(.trailing, 20)
                }
            }
              
            
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
                    Image("backArrow")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(Theme.tintColor!))
                        
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

//struct Activities_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivitiesView(title: "hello")
//    }
//}
