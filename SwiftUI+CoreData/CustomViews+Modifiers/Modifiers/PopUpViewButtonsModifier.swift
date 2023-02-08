//
//  PopUpViewButtons.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 06.02.2023.
//

import SwiftUI

// Buttons design for PopUpView

struct PopUpButton: ViewModifier {
    let shadowColor = Color(UIColor.darkGray).opacity(0.8)
    let shadowRadius: CGFloat = 5
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: 80, height: 36)
            .tint(Color.white)
            .background(RoundedRectangle(cornerRadius: 15).foregroundColor(Color(Theme.tintColor!)))
            .shadow(color: shadowColor, radius: shadowRadius, x: 2, y: 2)
            .padding()
        
    }
}
