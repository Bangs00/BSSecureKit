//
//  ContentView.swift
//  Example-SwiftUI
//
//  Created by 방현수 on 9/4/25.
//

import SwiftUI
import BSSecureKit

// BSSecureViewRepresentable is require iOS 13.0
struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            // Visible Content Label
            Text("This is visible content")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundColor(.black)
            
            // Secure Content
            BSSecureViewRepresentable {
                Text("This is secure content")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.black)
            }
            
            // Placeholder + Secure Overlay
            ZStack {
                Text("This is placeholder")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.black)
                
                BSSecureViewRepresentable {
                    Text("This is secure content")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.black)
                }
            }
        }
        .padding(16)
    }
}

#Preview {
    ContentView()
}
