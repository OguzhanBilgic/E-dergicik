//
//  Persistent.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

@propertyWrapper
struct Persistent<T:Codable> {
    
    private let key : String
    private let defaultValue : T?
    private let suite : String?
    
    init(key:String,defaultValue:T?,suite:String?=nil) {
        self.key = key
        self.defaultValue = defaultValue
        self.suite = suite
    }
    
    
    
    var wrappedValue: T? {
        get {
            var defaults = UserDefaults.standard
            if let suite = self.suite, let  suiteDefaults = UserDefaults.init(suiteName: suite) {
                defaults = suiteDefaults
            }
            if #available(iOS 13.0, *) {
                guard let data = defaults.object(forKey: key) as? Data else {
                    return defaultValue
                }
                
                let value = try? JSONDecoder().decode(T.self, from: data)
                return value ?? defaultValue
            }
            else {
                
                if T.self == String.self {
                    return defaults.string(forKey: key) as? T ?? defaultValue
                }
                
                if T.self == Bool.self {
                    return defaults.bool(forKey: key) as? T ?? defaultValue
                }
                
                guard let data = defaults.object(forKey: key) as? Data else {
                    return defaultValue
                }
                
                let value = try? JSONDecoder().decode(T.self, from: data)
                return value ?? defaultValue
            }
            
        }
        set {
            
            var defaults = UserDefaults.standard
            if let suite = self.suite, let  suiteDefaults = UserDefaults.init(suiteName: suite) {
                defaults = suiteDefaults
            }
            
            if #available(iOS 13.0, *) {
                let data = try? JSONEncoder().encode(newValue)
                defaults.set(data, forKey: key)
                return
            }
            else {
                if T.self == String.self {
                    defaults.setValue(newValue as? String, forKey: key)
                    return
                }
                
                if T.self == Bool.self {
                    defaults.setValue(newValue as? Bool, forKey: key)
                    return
                }
                
                let data = try? JSONEncoder().encode(newValue)
                defaults.set(data, forKey: key)
                return
            }
        }
    }
}
