//
//  AuthAPIService.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

struct AuthAPIService {
    
    //Mark: Guest Controller
    
    @POST(url: "\(BuildConfig.BASE_URL)/api/auth/guest/user")
    var createGuest: APICall<UserDTO>
    
    @POST(url: "\(BuildConfig.BASE_URL)/api/auth/guest/login")
    var loginGuest: APICall<LoginResponseDTO>
    
    
    //Mark: Client Controller
    
    @POST(url: "\(BuildConfig.BASE_URL)/api/auth/client/signup")
    var signUp: APICall<LoginResponseDTO>
    
    @PUT(url: "\(BuildConfig.BASE_URL)/api/auth/client/password")
    var updatePassword: APICall<ActionResourceResult>
    
    @POST(url: "\(BuildConfig.BASE_URL)/api/auth/client/password/recover")
    var passwordRecover: APICall<ActionResourceResult>
    
    @PUT(url: "\(BuildConfig.BASE_URL)/api/auth/client/mobile")
    var updateMobile: APICall<ActionResourceResult>
    
    @POST(url: "\(BuildConfig.BASE_URL)/api/auth/client/logout")
    var logOut: APICall<ActionResourceResult>
    
    @POST(url: "\(BuildConfig.BASE_URL)/auth/client/logout/all")
    var logOutAll : APICall<ActionResourceResult>
    
    @POST(url: "\(BuildConfig.BASE_URL)/api/auth/client/refreshToken")
    var refreshToken: APICall<LoginResponseDTO>
    
   
    
    @POST(url: "\(BuildConfig.BASE_URL)/api/auth/client/login")
    var login: APICall<LoginResponseDTO>
    
    
    
    //Mark: Code Controller
    
    @POST(url: "\(BuildConfig.BASE_URL)/api/auth/code/send/sms")
    var sendCode: APICall<ActionResourceResult>
    
    @POST(url: "\(BuildConfig.BASE_URL)/api/auth/code/verify/sms")
    var verifyCode: APICall<ActionResourceResult>
    
}
