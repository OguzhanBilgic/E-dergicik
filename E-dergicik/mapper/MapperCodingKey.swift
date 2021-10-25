//
//  MapperCodingKey.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

open class MapperCodingKey : CodingKey {
    
    public var stringValue: String
    
    required public init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    public var intValue: Int? {
        return nil
    }
    
    required public init?(intValue: Int) {
        return nil
    }
}
