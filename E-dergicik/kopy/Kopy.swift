//
//  Kopy.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

protocol Kopyable : Codable {
    
    var kopy : Self? {
        get
    }
}

extension Kopyable {
    
    var kopy : Self? {
        guard let data = try? JSONEncoder().encode(self) else {return nil}
        return try? JSONDecoder().decode(Self.self, from: data)
    }
}


extension Array : Any where Element : Codable {
    
    func kopy() -> Self? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return try? JSONDecoder().decode(Self.self, from: data)
    }
    
}
