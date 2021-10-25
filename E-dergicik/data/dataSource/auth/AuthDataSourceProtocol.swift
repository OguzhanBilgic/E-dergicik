//
//  AuthDataSourceProtocol.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

protocol AuthDataSourceProtocol {
    
    
    //MARK: guest
    
    func createGuest(_ completion:@escaping(UserDTO?) -> ())
    
    func loginGuest(_ completion:@escaping(LoginResponseDTO?) -> ())
    
    
    func getSession() -> EDSession?
    
    func setSession(session:EDSession?)
    
    func getAccount() -> User?
    
    func setAccount(account: User?)
    
    func isRenewingSession() -> Bool
    
    func setSessionRenewing(renewing:Bool)
    
    func sessionRenewRequestDate() -> Date?
    
    
    
    
    
    func signUp(request:SignUpRequest, _ completion:@escaping(LoginResponseDTO?) -> ())
    
    func updatePassword(request:UpdatePasswordRequest, _ completion:@escaping(ActionResourceResult?) -> ())
    
    func passwordRecover(request:PasswordRecoverRequest, _ completion:@escaping(ActionResourceResult?) -> ())
    
    func updateMobile(request:UpdateMobileRequest, _ completion:@escaping(ActionResourceResult?) -> ())
    
    func logOut(_ completion:@escaping(ActionResourceResult?) -> ())
    
    func logOutAll(_ completion:@escaping(ActionResourceResult?) -> ())
    
    func refreshToken(request:RefreshTokenRequest, _ completion:@escaping(LoginResponseDTO?) -> ())
    
    func login(request:LoginRequest, _ completion:@escaping(LoginResponseDTO?) -> ())
    
    
    
    func sendCode(request:SendCodeRequest, _ completion:@escaping(ActionResourceResult?) -> ())
    
    func verifyCode(request:VerifyCodeRequest, _ completion:@escaping(ActionResourceResult?) -> ())
    
}

extension AuthDataSourceProtocol {
    
    func createGuest(_ completion:@escaping(UserDTO?) -> ()) {}
    
    func loginGuest(_ completion:@escaping(LoginResponseDTO?) -> ()) {}
    
    
    
    func getSession() -> EDSession? {return nil}
    
    func setSession(session:EDSession?) {}
    
    func getAccount() -> User? {return nil}
    
    func setAccount(account:User?) {}
    
    func isRenewingSession() -> Bool {return false}
    
    func setSessionRenewing(renewing:Bool) {}
    
    func sessionRenewRequestDate() -> Date? {return nil}
    
    
    
    func signUp(request:SignUpRequest, _ completion:@escaping(LoginResponseDTO?) -> ()) {}
    
    func updatePassword(request:UpdatePasswordRequest, _ completion:@escaping(ActionResourceResult?) -> ()) {}
    
    func passwordRecover(request:PasswordRecoverRequest, _ completion:@escaping(ActionResourceResult?) -> ()) {}
    
    func updateMobile(request:UpdateMobileRequest, _ completion:@escaping(ActionResourceResult?) -> ()) {}
    
    func logOut(_ comğletion:@escaping(ActionResourceResult?) -> ()) {}
    
    func logOutAll(_ completion:@escaping(ActionResourceResult?) -> ()) {}
    
    func refreshToken(request:RefreshTokenRequest, _ completion:@escaping(LoginResponseDTO?) -> ()) {}
    
    func login(request:LoginRequest, _ completion:@escaping(LoginResponseDTO?) -> ()) {}
    
    
    
    func sendCode(request:SendCodeRequest, _ completion:@escaping(ActionResourceResult?) -> ()) {}
    
    func verifyCode(request:VerifyCodeRequest, _ completion:@escaping(ActionResourceResult?) -> ()) {}

}
