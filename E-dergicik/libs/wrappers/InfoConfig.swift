//
//  InfoConfig.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

@propertyWrapper
public struct InfoConfig<T> {
    
    var key : String
    
    init(_ key:String) {
        self.key = key
    }
    
    public var wrappedValue : T {
        get {
            return (Bundle.main.infoDictionary?[key] as! T)
        }
    }
}
