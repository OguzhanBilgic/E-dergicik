//
//  Resource.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation

public struct Resource<T:Decodable> {
    
    var data : T? = nil
    var error : ResourceError? = nil
    var status : ResourceStatus? = .idle
    
    
    static func success(data:T?) -> Resource<T> {
        return Resource<T>(data: data, status: .success)
    }
    
    static func fail(message:String?="",show:Bool?=false) -> Resource<T> {
        return Resource<T>(error:ResourceError(showMessage: show, message: message),status: .fail)
    }
    
    static func fail(error:ResourceError) -> Resource<T> {
        return Resource<T>(error:error,status: .fail)
    }
    
    
    
}

public struct ResourceError : Decodable {
    var showMessage : Bool?
    var message : String?
}

enum ResourceStatus : Int {
    case idle = 0
    case success = 1
    case fail = 2
    case loading = 3
}
