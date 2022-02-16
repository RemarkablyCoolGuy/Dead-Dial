//
//  SettingsView.swift
//  Dead Dial
//
//  Created by Samuel Sullins on 1/30/22.
//

import SwiftUI

struct SettingsView: View {

    @EnvironmentObject var settings: Settings
    
    var body: some View {
        
        List {
            
            Toggle("Failed Call", isOn: $settings.callShouldFail)
            
            HStack {

                Stepper("Fail After \(settings.callFailTime) seconds", value: $settings.callFailTime)
                
            }
            
        }
        .listStyle(.grouped)
        
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(Settings())
    }
}
