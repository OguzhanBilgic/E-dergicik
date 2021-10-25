//
//  AuthRemoteDataSource.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation
import Resolver

class AuthRemoteDataSource: AuthDataSourceProtocol {
    
    
    
    @Injected var service : AuthAPIService
    
    func createGuest(_ completion: @escaping (UserDTO?) -> ()) {
        service.createGuest(nil) { resource in
            completion(resource.data)
        }
    }
    
    func loginGuest(_ completion: @escaping (LoginResponseDTO?) -> ()) {
        service.loginGuest(nil) { resource in
            completion(resource.data)
        }
    }
    
    
    
    
    
    func signUp(request: SignUpRequest, _ completion: @escaping (LoginResponseDTO?) -> ()) {
        service.signUp(Params(body:Data.of(o: request))) { resource in
            completion(resource.data)
        }
    }
    func updatePassword(request: UpdatePasswordRequest, _ completion: @escaping (ActionResourceResult?) -> ()) {
        service.updatePassword(Params(body:Data.of(o: request))) { resource in
            completion(resource.data)
        }
    }
    func passwordRecover(request: PasswordRecoverRequest, _ completion: @escaping (ActionResourceResult?) -> ()) {
        service.passwordRecover(Params(body:Data.of(o: request))) { resource in
            completion(resource.data)
        }
    }
    func updateMobile(request: UpdateMobileRequest, _ completion: @escaping (ActionResourceResult?) -> ()) {
        service.updateMobile(Params(body:Data.of(o: request))) { resource in
            completion(resource.data)
        }
    }
    func logOut(_ completion: @escaping (ActionResourceResult?) -> ()) {
        service.logOut(nil) { resource in
            completion(resource.data)
        }
    }
    func logOutAll(_ completion: @escaping (ActionResourceResult?) -> ()) {
        service.logOutAll(nil) { resource in
            completion(resource.data)
        }
    }
    func refreshToken(request: RefreshTokenRequest, _ completion: @escaping (LoginResponseDTO?) -> ()) {
        service.refreshToken(Params(body:Data.of(o: request))) { resource in
            completion(resource.data)
        }
    }
    
    func login(request: LoginRequest, _ completion: @escaping (LoginResponseDTO?) -> ()) {
        service.login(Params(body:Data.of(o: request))) { resource in
            completion(resource.data)
        }
    }
    
   
    
    func sendCode(request: SendCodeRequest, _ completion: @escaping (ActionResourceResult?) -> ()) {
        service.sendCode(Params(body:Data.of(o: request))) { response in
            completion(response.data)
        }
    }
    
    func verifyCode(request: VerifyCodeRequest, _ completion: @escaping (ActionResourceResult?) -> ()) {
        service.verifyCode(Params(body:Data.of(o: request))) { response in
            completion(response.data)
        }
    }
}


