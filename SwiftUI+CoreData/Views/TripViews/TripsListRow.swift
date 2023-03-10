//
//  CustomRow.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 08.02.2023.
//

import SwiftUI

struct TripsListRow: View {
    
    var title: String
    var imageData: Data?
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(Theme.accentColor!))
                .frame(height: 160)
            
            if let imageData {
                if let imageToLoad = UIImage(data: imageData) {
                    Image(uiImage: imageToLoad)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 160)
                        .cornerRadius(10)
                        .clipped()
                }
            }
            
            Text(title)
                .font(Font(Theme.mainFont!))
                .foregroundColor(.white)
                .shadow(color: .black, radius: 10, x: 2, y: 2)
        }
        .shadow(color: .black, radius: 5, x: 3, y: 3)
    }
}

//struct CustomRow_Preview: PreviewProvider {
//    static var previews: some View {
//        CustomRow(title: "Some text")
//    }
//}
