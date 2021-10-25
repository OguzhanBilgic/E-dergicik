//
//  AuthLocalDataSource.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation
import Resolver

class AuthLocalDataSource: AuthDataSourceProtocol {
    
    
    func getSession() -> EDSession? {
        return AuthDefaultsService.session
    }
    
    
    func setSession(session: EDSession?) {
        AuthDefaultsService.session = session
    }
    
    func getAccount() -> User? {
        return AuthDefaultsService.account
    }
    
    func setAccount(account: User?) {
        AuthDefaultsService.account = account
    }
    
    func isRenewingSession() -> Bool {
        return AuthDefaultsService.renewingSession ?? false
    }
    
    func setRenewingSession(renewing:Bool) {
        AuthDefaultsService.renewingSession = renewing
    }
    
    func setSessionRenewRequestDate(date:Date) {
        AuthDefaultsService.sessionRenewRequestDate = date
    }
    
    func getSessionRenewRequestDate() -> Date? {
        return AuthDefaultsService.sessionRenewRequestDate
        
    }
}
