//
//  AddViewsModifier.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 07.02.2023.
//

import SwiftUI

struct AddViewsModifier: ViewModifier {
    let width: CGFloat = 350
    let height: CGFloat?
    let bottomPadding: CGFloat?
    
    func body(content: Content) -> some View {
        content
            .frame(width: width,height: height)
            .padding(.bottom, bottomPadding)
            .shadow(color: Color.black, radius: 10, x: 3, y: 3)
    }
}
