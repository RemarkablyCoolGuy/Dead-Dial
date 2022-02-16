//
//  NumberButton.swift
//  Dead Dial
//

import SwiftUI

/// A nice round phone button.
struct NumberButton: View {
    
    /// Whenever this button is pressed, `textToUpdate` gets the button's `text` appended to it.
    @Binding var textToUpdate: String
    
    /// The big number on the button.
    var text: String
    /// The letters that go below the number.
    var subtext: String?

    var body: some View {
        
        Button {
            
            // Update the text
            textToUpdate += text
            
        } label: {
            
            VStack {
            
                // Main text
                Text(text)
                    .bold()
                    .font(.system(size: Sizes.buttonNumber, weight: .light))
                    .foregroundColor(.label)
                
                // Only show subtext if there IS any subtext, otherwise use a spacer
                if let s = subtext {
                    
                    Text(s)
                        .bold()
                        .font(.system(size: Sizes.buttonLetters, weight: .regular, design: .default))
                        .foregroundColor(.label)
                    
                } else {
                    
                    Spacer()
                        .frame(height: 8)
                    
                }
                
            }
            .frame(width: Sizes.buttonSize, height: Sizes.buttonSize)
            .background(Circle()
                            .fill(Color.systemFill)
                            )
            
        }
        
    }
    
}
