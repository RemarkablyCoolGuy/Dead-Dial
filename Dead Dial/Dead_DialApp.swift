//
//  Dead_DialApp.swift
//  Dead Dial
//
//  Created by Samuel Sullins on 1/29/22.
//

import SwiftUI

@main
struct Dead_DialApp: App {
    
    @StateObject var settings = Settings()
    
    var body: some Scene {
        WindowGroup {
            
            TabView {
                
                KeypadView()
                    .environmentObject(settings)
                    .tabItem {
                        
                        Label("Keypad", systemImage: "circle.grid.3x3.fill")
                        
                    }
                
                SettingsView()
                    .environmentObject(settings)
                    .tabItem {
                        
                        Label("Settings", systemImage: "gear")
                        
                    }
                
            }
            
        }
    }
}
