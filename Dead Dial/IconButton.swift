//
//  IconButton.swift
//  Dead Dial
//

import SwiftUI

/// Just like `NumberButton`, but shows an SF Symbol instead.
struct IconButton: View {
    
    /// The color of the displayed icon
    var color: Color
    /// Name of an SF Symbol
    var image: String
    /// Run this action when button pressed
    var action: () -> Void
    
    var body: some View {
        
        Button {
            
            action()
            
        } label: {
            
            VStack {
            
                Image(systemName: image)
                    .foregroundColor(.white)
                    .font(.title)
                
            }
            .frame(width: Sizes.buttonSize, height: Sizes.buttonSize)
            .background(Circle()
                            .fill(color)
                            )
            
        }
        
    }
    
}
