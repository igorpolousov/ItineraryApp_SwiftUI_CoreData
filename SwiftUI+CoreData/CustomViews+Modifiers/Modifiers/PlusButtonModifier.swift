//
//  PlusButtonModifier.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 07.02.2023.
//

import SwiftUI

struct PlusButton: ViewModifier {
    
    let shadowColor = Color(UIColor.darkGray)
    let shadowRadius = 4
    
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .frame(width: 62, height: 62)
            .aspectRatio(contentMode: .fill)
            .background(Circle().foregroundColor(Color(Theme.tintColor!)))
            .shadow(color: shadowColor ,radius: CGFloat(shadowRadius),x: 2, y: 2)
            .overlay(Circle().stroke(shadowColor, lineWidth: 1))
    }
 
}
