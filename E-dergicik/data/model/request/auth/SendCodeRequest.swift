//
//  SendCodeRequest.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

struct SendCodeRequest: Codable {
    
    let mobile: String?
    var purpose: CodePurpose? = .verify
}
