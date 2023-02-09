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
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(Color.white))
            .padding(.leading, 30)
            .padding(.trailing, 30)
    }
    
}
