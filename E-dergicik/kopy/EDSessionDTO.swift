//
//  EDSessionDTO.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation
import RealmSwift

struct EDSessionDTO : Codable {
    
    let id : String?
    let userId : String?
    let token : String
    let guest : Bool?
    let refreshToken : String
}
