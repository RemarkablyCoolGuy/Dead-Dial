//
//  Settings.swift
//  Dead Dial
//
//  Created by Samuel Sullins on 1/30/22.
//

import Foundation
import SwiftUI


class Settings: ObservableObject {
    
    @Published var callShouldFail = true
    @Published var callFailTime = 2
    
}
