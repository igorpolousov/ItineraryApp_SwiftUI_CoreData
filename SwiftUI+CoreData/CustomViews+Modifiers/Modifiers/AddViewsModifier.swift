//
//  AddViewsModifier.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 07.02.2023.
//

import SwiftUI

struct AddViewsModifier: ViewModifier {
    let height: CGFloat?
    let bottomPadding: CGFloat?
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .padding(.bottom, bottomPadding)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .shadow(color: Color.black, radius: 10, x: 3, y: 3)
    }
}
