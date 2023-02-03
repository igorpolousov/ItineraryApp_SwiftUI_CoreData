//
//  ActivitiesView.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//

import SwiftUI

struct ActivitiesView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .foregroundColor(Color(Theme.swipeEditColor!))
            Text("Avtivities view")
                .font(Font(Theme.mainFont!))
        }
        .padding()
    }
}


struct Activities_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}
