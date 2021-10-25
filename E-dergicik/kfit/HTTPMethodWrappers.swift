//
//  HTTPMethodWrappers.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation
import Resolver

public typealias APICall<T:Decodable> = (_ params:Params?,_ completionhandler: @escaping (Resource<T>) -> ()) -> ()

@propertyWrapper
public class GET<T: Decodable> {
    public var url: String
    
    init(url: String) {
        self.url = url
    }
    
    @Injected var caller : APICaller
    
    public var wrappedValue : APICall<T> {
        get {
            return { params,call in
                
                self.caller.call(method:.get, url: self.url, params:params) { resource in
                    call(resource)
                }
            }
        }
    }
}

@propertyWrapper
public class POST<T: Decodable> {
    
    @Injected var caller : APICaller
    
    public var url: String
    init(url: String) {
        self.url = url
    }
    
    
    public var wrappedValue : APICall<T> {
        get {
            return { params,call in
                
                self.caller.call(method:.post, url: self.url, params:params) { resource in
                    call(resource)
                }
            }
        }
    }
    
    
}


@propertyWrapper
public class PUT<T: Decodable> {
    
    @Injected var caller : APICaller
    
    public var url: String
    init(url: String) {
        self.url = url
    }
    
    public var wrappedValue : APICall<T> {
        get {
            return { params,call in
                
                self.caller.call(method:.put, url: self.url, params:params) { resource in
                    call(resource)
                }
            }
        }
    }
    
}


@propertyWrapper
public class DELETE<T: Decodable> {
    
    @Injected var caller : APICaller
    
    public var url: String
    init(url: String) {
        self.url = url
    }
    
    public var wrappedValue : APICall<T> {
        get {
            return { params,call in
                
                self.caller.call(method:.delete, url: self.url, params:params) { resource in
                    call(resource)
                }
            }
        }
    }
    
}



@propertyWrapper
public class PATCH<T: Decodable> {
    
    @Injected var caller : APICaller
    
    public var url: String
    init(url: String) {
        self.url = url
    }
    
    public var wrappedValue : APICall<T> {
        get {
            return { params,call in
                
                self.caller.call(method:.patch, url: self.url, params:params) { resource in
                    call(resource)
                }
            }
        }
    }
    
}
