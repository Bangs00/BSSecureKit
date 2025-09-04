//
//  ContentView.swift
//  Example-SwiftUI
//
//  Created by BangS00 on 9/4/25.
//

import SwiftUI
import BSSecureKit

struct ContentView: View {
    @State private var isSecured = true
    
    var body: some View {
        VStack(spacing: 16) {
            // Visible Content Label
            Text("This is visible content")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundColor(.black)
            
            // Secure Content
            BSSecureViewRepresentable(isSecure: self.isSecured) {
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
                
                BSSecureViewRepresentable(isSecure: self.isSecured) {
                    Text("This is secure content")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.black)
                }
            }
            
            // Toggle Button
            Button(action: {
                self.isSecured.toggle()
            }) {
                Text(self.isSecured ? "Secured" : "Not Secured")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding(16)
    }
}

#Preview {
    ContentView()
}
