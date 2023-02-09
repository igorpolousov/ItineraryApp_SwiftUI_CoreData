//
//  CustomRow.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 08.02.2023.
//

import SwiftUI

struct CustomRow: View {
    
    var content: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(Theme.accentColor!))
                .frame(height: 160)
            
            Text(content)
                .font(Font(Theme.mainFont!))
                .foregroundColor(.white)
                .shadow(color: .black, radius: 10, x: 2, y: 2)
        }
        .shadow(color: .black, radius: 5, x: 3, y: 3)
    }
}

struct CustomRow_Preview: PreviewProvider {
    static var previews: some View {
        CustomRow(content: "Some text")
    }
}
