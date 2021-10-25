//
//  KFitDecodingDateFormatter.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

class KFitDecodingDateFormatter : DateFormatter {
    
    override func date(from string: String) -> Date? {
        
        
        
        for format in KFit.DECODING_DATE_FORMATS {
            let formatter = DateFormatter()
            formatter.dateFormat = format
            formatter.locale = Locale(identifier: "tr_TR")
            if let date = formatter.date(from: string) {
                return date
            }
        }
        
        return nil
        
        
        
    }
}
