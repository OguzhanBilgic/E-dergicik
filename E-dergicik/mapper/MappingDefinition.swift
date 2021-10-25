//
//  MappingDefinition.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

struct MappingDefinition {
    
    let name : String
    let mappedName : String
    
    let invalidatorKeys : [String]?
    let conditionKeys : [String]?
}
