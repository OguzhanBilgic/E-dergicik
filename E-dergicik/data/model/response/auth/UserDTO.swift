//
//  UserDTO.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation
import RealmSwift

struct UserDTO : Codable {
    
    
    let id : String?
    let mobile : String?
    let email : String?
    let isCorporate : Bool?
    let isBundle : Bool?
    let subscribed : Bool?
    let guest : Bool?
    
}
