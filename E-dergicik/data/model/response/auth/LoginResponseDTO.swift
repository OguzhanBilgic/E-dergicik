//
//  LoginResponseDTO.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation


struct LoginResponseDTO : Codable {
    
    let session : EDSession?
    let user : UserDTO?
    
}
