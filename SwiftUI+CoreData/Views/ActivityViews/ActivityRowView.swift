//
//  ActivityView.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 28.02.2023.
//

import SwiftUI

struct ActivityView: View {
    
    @State var title: String = "Label"
    @State var subtitle: String = "SubtitleLabel"
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(Theme.accentColor!))
            
            HStack {
                Image("hotel")
                    .foregroundColor(Color(Theme.tintColor!))
                    .shadow(color:.white ,radius: 1.5)
                
                VStack(alignment:.leading) {
                    Text(title)
                        .foregroundColor(Color(.lightGray))
                        .font(Font(Theme.activityFont!))
                    Text(subtitle)
                        .foregroundColor(Color(.lightGray))
                        .font(Font(Theme.activityFont!))
                }
                .padding(.leading, 20)
                
                Spacer()
            }
            .padding(.leading, 10)
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
