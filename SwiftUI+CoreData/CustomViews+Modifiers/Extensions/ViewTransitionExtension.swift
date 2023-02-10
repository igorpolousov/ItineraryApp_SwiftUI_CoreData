//
//  ViewTransitionExtension.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 08.02.2023.
//

import SwiftUI
import UIKit

fileprivate var currentOverCurrentContextUIHost: UIHostingController<AnyView>? = nil

extension View {
    
    func overCurrentContext(
        isPresented: Binding<Bool>,
        showWithAnimate: Bool = false,
        dismissWithAnimate: Bool = false,
        modalPresentationStyle: UIModalTransitionStyle = .crossDissolve,
        content: () -> AnyView
    ) -> some View {
        if isPresented.wrappedValue && currentOverCurrentContextUIHost == nil {
            let uiHost = UIHostingController(rootView: content())
            currentOverCurrentContextUIHost = uiHost
            
            uiHost.modalPresentationStyle = .overCurrentContext
                        uiHost.modalTransitionStyle = modalPresentationStyle
            uiHost.view.backgroundColor = UIColor.clear
            
            
            let rootVC = UIApplication.shared.windows.first?.rootViewController
            rootVC?.present(uiHost, animated: showWithAnimate, completion: nil)
            
        } else {
            if let uiHost = currentOverCurrentContextUIHost {
                uiHost.dismiss(animated: dismissWithAnimate, completion: {})
                                currentOverCurrentContextUIHost = nil
            }
        }
        return self
    }
}
