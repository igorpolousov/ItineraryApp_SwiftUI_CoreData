//
//  TextFieldModifier.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 07.02.2023.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 330, height: 40)
            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(Color.white))
            .padding(.leading, 10)
            .padding(.trailing, 10)
    }
    
}
