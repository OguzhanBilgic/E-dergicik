//
//  AuthRepository.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 12.10.2021.
//

import Foundation
import Resolver

class AuthRepository {
    
    @Injected var remote: AuthRemoteDataSource
    @Injected var local: AuthLocalDataSource
    
    func getSession() -> EDSession? {
        return local.getSession()
    }
    
    func gotSession() -> Bool {
        let session = getSession()
        return (session?.userId?.count ?? 0 > 0 &&
                session?.token?.count ?? 0 > 0)
    }
    
    func setSession(session: EDSession?) {
        local.setSession(session: session)
    }
    
    func getAccount() -> User? {
        return local.getAccount()
    }
    
    func setAccount(account: User?) {
        return local.setAccount(account: account)
    }
    
    func createGuest(_ completion : @escaping (UserDTO?) -> ()) {
        remote.createGuest { result in
            if let result = result, let entity = Mapper.map(source: result, type: User.self) {
                self.local.setAccount(account: entity)
            }
            completion(result)
        }
    }
    
    func loginGuest(_ completion : @escaping (LoginResponseDTO?) -> ()) {
        remote.loginGuest { (result) in
            if let result = result, let session = Mapper.map(source: result.session, type: EDSession.self), let account = Mapper.map(source: result.user, type: User.self) {
                self.local.setAccount(account: account)
                self.local.setSession(session: session)
                
                completion(result)
            }
            else {
                completion(nil)
            }
        }
    }
    
    func clearAllPersonalValues() {
        self.local.setAccount(account: nil)
        self.local.setSession(session: nil)
    }
    
    func login(request:LoginRequest, _ completion : @escaping(LoginResponseDTO?) -> ()) {
        remote.login(request: request) { result in
            if let result = result, let session = Mapper.map(source: result.session, type: EDSession.self), let account = Mapper.map(source: result.user, type: User.self ) {
                self.local.setSession(session: session)
                self.local.setAccount(account: account)
                completion(result)
            }
            else {
                completion(nil)
            }
        }
    }
    
    func signUp(request:SignUpRequest, _ completion : @escaping(LoginResponseDTO?) -> ()) {
        remote.signUp(request: request) { result in
            if let result = result, let account = Mapper.map(source: result.user, type: User.self), let session = Mapper.map(source: result.session, type: EDSession.self) {
                
                self.local.setSession(session: session)
                self.local.setAccount(account: account)
                
                completion(result)
            }else {
                completion(nil)
            }
        }
    }
    
    func verifyCode(request: VerifyCodeRequest, _ completion: @escaping (Bool) -> ()) {
        remote.verifyCode(request: request) { (response) in
            completion(response?.result == true)
        }
    }
        
    func sendCode(request:SendCodeRequest, _ comletion: @escaping(Bool?) -> ()) {
        remote.sendCode(request: request) { resource in
            comletion(resource?.result == true)
        }
    }
    
    
    func updatePassword(request: UpdatePasswordRequest, _ completion : @escaping(Bool) -> ()) {
        remote.updatePassword(request: request) { resource in
            if resource?.result == true {
                if let account = self.local.getAccount() {
                    self.local.setAccount(account: account)
                }
            }
        }
    }
    
    func isRenewingSession() -> Bool? {
        let renewing = local.isRenewingSession()

        if renewing {
            if let requestDate = local.getSessionRenewRequestDate() {
                let difference = Calendar.current.dateComponents([.second], from: requestDate, to: Date()).second ?? 0
                if difference > 30 {
                    print("session renew time difference: \(difference)")
                    local.setSessionRenewing(renewing: false)
                    return false
                }
                else {
                    return true
                }
            }
            else {
                local.setSessionRenewing(renewing: false)
                return false
            }
        }
        else {
            return false
        }
    }
}




