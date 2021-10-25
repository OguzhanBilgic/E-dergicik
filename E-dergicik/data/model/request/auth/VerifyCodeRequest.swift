//
//  VerifyCodeRequest.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

struct VerifyCodeRequest: Codable {
    
    let mobile: String?
    let purpose: CodePurpose 
    let code: String?
}
