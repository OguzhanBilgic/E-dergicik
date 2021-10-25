//
//  LoginRequest.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

struct LoginRequest: Codable {
    
    let mobile: String?
    let password: String?
}

