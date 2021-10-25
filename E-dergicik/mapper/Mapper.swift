//
//  Mapper.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

class Mapper {
    
    static func map<S:Encodable,O:Decodable>(source:S,type:O.Type) -> O? {
        
        do {
            let data = try JSONEncoder().encode(source)
            
            
            
            let output = try JSONDecoder().decode(type, from: data)
            return output
        }
        catch {
            print("mapper error : \(source.self) to \(O.self) \(error)")
            return nil
        }
    }
    
    
    static func map<S:Encodable,O:Decodable>(source:S,type:O.Type,definitions:[MappingDefinition]) -> O? {
        
        do {
            
            
            let encoder = JSONEncoder()
            
            encoder.keyEncodingStrategy = .custom({ keys -> CodingKey in
                
                let key = keys.last!
                if key.intValue != nil {
                    return key // It's an array key, we don't need to change anything
                }
                
                if let definition = definitions.first(where: {$0.name == key.stringValue}) { // check if key meets a definition by name
                    
                    if !isInvalid(keys: keys, definition: definition) && meetsConditions(keys: keys, definition: definition) {
                        return MapperCodingKey(stringValue: definition.mappedName)!
                    }
                    else {
                        return key
                    }
                    
                }
                else {
                    return key
                }
                
            })
            
            let data = try encoder.encode(source)
            
            
            let output = try JSONDecoder().decode(type, from: data)
            return output
        }
        catch {
            print("mapper error : \(source.self) to \(O.self) \(error)")
            return nil
        }
    }
    
    
    static func isInvalid(keys:[CodingKey], definition:MappingDefinition) -> Bool {
        
        guard let invalidators = definition.invalidatorKeys else {return false}
        
        for key : CodingKey in keys {
            if let _ = invalidators.first(where: {$0 == key.stringValue}) {
                return true
            }
        }
        
        return false
    }
    
    
    static func meetsConditions(keys:[CodingKey],definition:MappingDefinition) -> Bool {
        
        guard let conditions = definition.conditionKeys else { return true }
        
        for condition : String in conditions {
            
            guard let _ = keys.first(where: {$0.stringValue == condition}) else {return false}
        }
        
        return false
    }
}
