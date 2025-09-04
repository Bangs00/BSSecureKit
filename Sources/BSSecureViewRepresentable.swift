//
//  BSSecureViewRepresentable.swift
//  BSSecureKit
//
//  Created by BangS00 on 9/4/25.
//

import SwiftUI

public struct BSSecureViewRepresentable<Content: View>: UIViewRepresentable {
    let content: Content
    let isSecure: Bool
    
    public init(isSecure: Bool = true, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.isSecure = isSecure
    }
    
    public func makeUIView(context: Context) -> BSSecureView {
        let secureView = BSSecureView()
        let hosting = UIHostingController(rootView: self.content)
        hosting.view.backgroundColor = .clear
        hosting.view.translatesAutoresizingMaskIntoConstraints = false
        
        secureView.embed(hosting.view)
        secureView.isSecure = self.isSecure
        return secureView
    }
    
    public func updateUIView(_ uiView: BSSecureView, context: Context) { 
        uiView.isSecure = isSecure
    }
}
