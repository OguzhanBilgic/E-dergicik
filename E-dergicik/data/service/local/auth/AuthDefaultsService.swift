//
//  AuthDefaultService.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation
import RealmSwift

struct AuthDefaultsService {
    
    enum keys: String {
        case session = "AuthDefaultsService.Session"
        case user = "AuthDefaultsService.User"
        case renewingSession = "AuthDefaultsService.RenewingSession"
        case sessionRenewRequestDate = "AuthDefaultsService.SessionRenewRequestDate"
    }
    
    @Persistent(key: keys.session.rawValue, defaultValue: nil)
    static var session: EDSession?
    
    @Persistent(key: keys.user.rawValue, defaultValue: nil)
    static var account: User?
    
    @Persistent(key: keys.renewingSession.rawValue, defaultValue: false)
    static var renewingSession: Bool?
    
    @Persistent(key: keys.sessionRenewRequestDate.rawValue, defaultValue: nil)
    static var sessionRenewRequestDate: Date?
}
