//
//  HeaderView.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 28.02.2023.
//

import SwiftUI

struct HeaderView: View {
    
    @State var text: String = "Hello"
    @State var descriptionText: String = " Big Description"
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(Color(.black))
                .font(Font(Theme.dayFont!))
                
            Spacer()
            
            Text(descriptionText)
                .foregroundColor(Color(Theme.tintColor!))
                .font(Font(Theme.dayFont!))
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
