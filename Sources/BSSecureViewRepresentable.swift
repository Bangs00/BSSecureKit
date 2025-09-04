//
//  BSSecureViewRepresentable.swift
//  BSSecureKit
//
//  Created by 방현수 on 9/4/25.
//

import SwiftUI

public struct BSSecureViewRepresentable<Content: View>: UIViewRepresentable {
    let content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public func makeUIView(context: Context) -> BSSecureView {
        let secureView = BSSecureView()
        let hosting = UIHostingController(rootView: self.content)
        hosting.view.backgroundColor = .clear
        hosting.view.translatesAutoresizingMaskIntoConstraints = false
        
        secureView.embed(hosting.view)
        return secureView
    }
    
    public func updateUIView(_ uiView: BSSecureView, context: Context) { }
}
