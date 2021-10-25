//
//  Default.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

@propertyWrapper
public struct Default<T> {
    
    var baseValue: T?
    var defaultValue : T
    
    public init(_ defaultValue:T) {
        self.defaultValue = defaultValue
    }
    
    
    
    
    public var wrappedValue: T {
        get {
            baseValue ?? defaultValue
        }
        set {
            baseValue = newValue
            
        }
    }
    
}
