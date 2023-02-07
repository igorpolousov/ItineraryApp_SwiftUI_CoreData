//
//  ActivitiesView.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//

import SwiftUI

struct ActivitiesView: View {
    var body: some View {
        ZStack {
            Color(Theme.backgroundColor!)
                .edgesIgnoringSafeArea(.all)
            
            Button {
                // Plus button action
            } label: {
                Image("plus")
                    .tint(Color.white)
                    .modifier(PlusButton())
                    .padding(.top, 680)
                    .padding(.leading, 280)
            }

        }
    }
}

struct Activities_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}
