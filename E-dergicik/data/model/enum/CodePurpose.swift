//
//  CodePurpose.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

enum CodePurpose: Int, Codable {
  case signup = 0
  case passwordRecovery = 1
  case login = 2
  case updateMobile = 3
  case verify = 4
  case updatePassword = 5


}
