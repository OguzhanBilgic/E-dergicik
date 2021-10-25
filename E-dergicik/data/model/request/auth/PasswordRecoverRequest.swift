//
//  RecoverPasswordRequest.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

struct PasswordRecoverRequest: Codable {
    
    let newPassword: String?
    let code: String?
    let mobile: String?
}
