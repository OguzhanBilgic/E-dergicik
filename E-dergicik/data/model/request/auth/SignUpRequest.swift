//
//  SignUpRequest.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

struct SignUpRequest: Codable {
    
    let mobile: String?
    let password: String?
    let email: String?
    let code: String?
}
