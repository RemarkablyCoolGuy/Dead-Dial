//
//  ContentView.swift
//  Dead Dial
//

import SwiftUI

struct KeypadView: View {
    
    /// The Settings object configured by the user in SettingsView
    @EnvironmentObject var settings: Settings
    
    /// Is a call currently in progress?
    @State var isCalling = false
    /// The big text that displays the number currently being called.
    @State var text = ""
    /// The text below the number being dialed, which tells whether the call was ended or failed.
    @State var subtext = ""
    
    /// The timer used to fake failed calls.
    @State var timer: Timer!
    
    var body: some View {
        
        ZStack {

            let spacing: CGFloat = 30
            
            VStack {
                
                Spacer()
                
                // The phone number at the top
                Text(text)
                    .font(.system(size: 32))
                    .foregroundColor(.label)
                    .frame(height: 16)
                // THe text beneath it
                Text(subtext)
                    .font(.body)
                    .foregroundColor(.label)
                    .frame(height: 16)
                    .padding()
                
                // The actual keypad
                VStack(alignment: .center, spacing: 11) {
                
                    HStack(alignment: .center, spacing: spacing) {
                        NumberButton(textToUpdate: $text, text: "1")
                        NumberButton(textToUpdate: $text,text: "2", subtext: "ABC")
                        NumberButton(textToUpdate: $text,text: "3", subtext: "DEF")
                    }
                    HStack(alignment: .center, spacing: spacing) {
                        NumberButton(textToUpdate: $text,text: "4", subtext: "GHI")
                        NumberButton(textToUpdate: $text,text: "5", subtext: "JKL")
                        NumberButton(textToUpdate: $text,text: "6", subtext: "MNO")
                    }
                    HStack(alignment: .center, spacing: spacing) {
                        NumberButton(textToUpdate: $text,text: "7", subtext: "PQRS")
                        NumberButton(textToUpdate: $text,text: "8", subtext: "TUV")
                        NumberButton(textToUpdate: $text,text: "9", subtext: "WXYZ")
                    }
                    HStack(alignment: .center, spacing: spacing) {
                        NumberButton(textToUpdate: $text,text: "*")
                        NumberButton(textToUpdate: $text,text: "0", subtext: "+")
                        NumberButton(textToUpdate: $text,text: "#")
                    }
                    
                    HStack(alignment: .center, spacing: spacing) {
                        
                        // The clear button
                        Button {
                            
                            text = ""
                            subtext = ""
                            
                        } label: {
                            
                            ZStack(alignment: .center) {
                            
                                Image(systemName: "xmark.circle")
                                    .font(.title)
                                    .foregroundColor(Color.secondaryLabel)
                                    .opacity((text.count > 0 || subtext.count > 0) ? 1 : 0)
                                
                                Spacer()
                                    .frame(width: 72, height: 72)
                                
                            }
                            
                        }
                        
                        // The call button
                        IconButton(color: isCalling ? .red : .green, image: isCalling ?  "phone.down.fill" : "phone.fill") {
                            
                            if isCalling {
                                
                                timer?.invalidate()
                                subtext = "Call Ended"
                                isCalling = false
                                text = ""
                                
                            } else {
                                
                                isCalling = true
                                subtext = "Dialing..."
                                
                                if settings.callShouldFail {
                                
                                    timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(settings.callFailTime), repeats: false) { timer in
                                        
                                        subtext = "Call Failed"
                                        isCalling = false
                                        text = ""
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                        // The backspace button
                        Button {
                            
                            text = String(text.prefix(text.count - 1))
                            
                        } label: {
                            
                            ZStack(alignment: .center) {
                            
                                Image(systemName: "delete.left")
                                    .font(.title)
                                    .foregroundColor(Color.secondaryLabel)
                                    .opacity(text.count > 0 ? 1 : 0)
                                
                                Spacer()
                                    .frame(width: Sizes.buttonSize, height: Sizes.buttonSize)
                                
                            }
                            
                        }
                    
                }
                
                }
        
                Spacer()
                
            }
        
        }
        
    }
    
}

struct KeypadView_Previews: PreviewProvider {
    static var previews: some View {
        KeypadView()
            //.previewDevice("iPhone 11 Pro Max")
            .preferredColorScheme(.dark)
    }
}
