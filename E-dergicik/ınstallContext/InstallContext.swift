//
//  InstallContext.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 18.10.2021.
//

import Foundation


struct InstallContext {
    
    
    enum keys : String {
        case previousVersion = "InstallContext.PreviousVersion"
        case onboardingSeen = "InstallContext.OnboardingSeen"
        case pushToken = "InstallContext.PushToken"
        case firstLoopSeen = "InstallContext.FirstLoopSeen"
    }
    
    @Persistent(key: keys.previousVersion.rawValue, defaultValue: "0.0.0")
    static var previousVersion
    
    @Persistent(key: keys.onboardingSeen.rawValue, defaultValue: false)
    static var onboardingSeen
    
    @Persistent(key: keys.pushToken.rawValue, defaultValue: "")
    static var pushToken
    
    @Persistent(key: keys.firstLoopSeen.rawValue, defaultValue: false)
    static var firstLoopSeen
}
