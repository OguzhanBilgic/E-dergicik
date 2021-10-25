//
//  KFitExtensions.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

extension Data {
    
    
    
    static func of<T:Codable>(o:T) -> Data? {
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .formatted(DateFormatter.kfitFormatter)
            return try encoder.encode(o)
        }
        catch {
            if APICaller.logs {
                print("request encoder error : from \(o.self) \(error)")
            }
            return nil
        }
    }
    
    var prettyJson: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = String(data: data, encoding:.utf8) else { return nil }

        return prettyPrintedString
    }
    
    var stringUTF8 : String? {
        get {
            return String(data: self, encoding: .utf8)
        }
    }
}

extension String {
    
    
    mutating func applyRouteParameters(params:[String:Any]) -> String {
        for (key,value) in params {
            
            if self.contains("{\(key)}") {
                if let value = String.from(value) {
                    self = self.replacingOccurrences(of: "{\(key)}", with: value)
                }
                
            }
        }
        
        return self
    }
    
    
    func applyQueryParameters(params:[String:Any]) -> String {
        var result = "\(self)?"
        
        var index : Int = 0
        for (key,value) in params {
            
            if let value = String.from(value)?.addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed) {
                result = "\(result)\(key)=\(value)"
            }
            
            if index < (params.count - 1) {
                result = "\(result)&"
            }
            
            index += 1
        }
        
        return result
        
    }
    
    func asURL() -> URL? {
        return URL(string: self)
    }
    
    
    public static func from(_ value:Any?) -> String? {
        if let nonNil = value, !(nonNil is NSNull) {
            return String(describing: nonNil)
        }
        return nil
    }
}


extension DateFormatter {
    
    public static var kfitFormatter : DateFormatter {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = KFit.DATE_FORMAT
            formatter.timeZone = .current
            return formatter
        }
    }
}
