//
//  APICaller.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation
import Alamofire
import MaterialComponents

public class APICaller {
    
    static var logs : Bool = true
    
    var delayTest : Bool = false
    var delay : TimeInterval = 1.0
    
    
    func call<T:Decodable>(method:HTTPMethod, url:String, params:Params?, completion : @escaping (Resource<T>) -> ()) {
        
        //print("APICaller : \(url)")
        var path = url
        if let routeParams = params?.route {
            path = path.applyRouteParameters(params: routeParams)
        }
        
        if let queryParams = params?.query {
            path = path.applyQueryParameters(params: queryParams)
        }
        
        guard let url = URL(string: path) else {
            completion(Resource.fail())
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        
        if let body = params?.body {
            request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = body
            //print("APICaller body : \(body.prettyJson ?? "")")
        }
        
        
        let requestDate = Date()
        
        if let file = params?.file {
            
            AF.upload(multipartFormData: { MultipartFormData in
                MultipartFormData.append(file, withName: "image" , fileName: "image.jpeg" , mimeType: "image/jpeg")
                
            },
            to: path, method: method,
            headers: ["Content-Type": "application/json"],interceptor: APICallInterceptor())
            .response { (response) in
                
                if self.delayTest {
                    DispatchQueue.main.asyncAfter(deadline: .now()+self.delay) { completion(self.resourceFromResponse(response: response)) }
                }
                else {
                    completion(self.resourceFromResponse(response: response))
                }
            }
        }
        else {
            
            let now = Date()
            
            if #available(iOS 13.0, *) {
                if APICaller.logs {
                    print("Request duration : \(now.distance(to: requestDate))")
                }
            }
            
            
            
            AF.request(request,interceptor: APICallInterceptor()).validate(statusCode: 200..<300).response { response in
                if self.delayTest {
                    DispatchQueue.main.asyncAfter(deadline: .now()+self.delay) { completion(self.resourceFromResponse(response: response)) }
                }
                else {
                    completion(self.resourceFromResponse(response: response))
                }
            }
        }
    }
    
    func decode<T:Decodable>(data:Data) -> T? {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(KFitDecodingDateFormatter())
            let result = try decoder.decode(T.self, from: data)
            return result
        }
        catch {
            if APICaller.logs {
                print("API Caller decoding error : to \(T.self) \(error) json :\n\(data.prettyJson ?? "")")
            }
            return nil
        }
    }
    
    
    func resourceFromResponse<T:Decodable>(response:AFDataResponse<Data?>) -> Resource<T> {
        
        if APICaller.logs {
            print("API Caller Result : \(response.request?.url?.absoluteString ?? "") \(response.response?.statusCode ?? 0)")
        }
        
        switch(response.result) {
        
        case .success(let data):
            if response.response?.statusCode == 204 {
                return Resource(status:.success)
            }
            else if data != nil && T.self == String.self {
                return Resource.success(data: data?.stringUTF8 as? T)
            }
            else if let data = data, let result:T = decode(data: data) {
                if APICaller.logs {
                    print("API Caller : \(response.request?.url?.absoluteString ?? "") \(response.response?.statusCode ?? 0) \(data.stringUTF8 ?? "")")
                }
                
                return Resource.success(data: result)
            }
            else {
                
                return Resource.fail()
            }
            
        case .failure(let error):
            
            if APICaller.logs {
                print(error.localizedDescription)
            }
            
            if let data = response.data, let result = try? JSONDecoder().decode(ResourceError.self, from: data) {
                
                if APICaller.logs {
                    print("API Caller Edergi API error : \(result.message ?? "")")
                }
                
                if result.showMessage == true {
                    MDCSnackbarManager.default.snackbarMessageViewBackgroundColor = .red
                    MDCSnackbarManager.default.messageTextColor = .white
                    let message = MDCSnackbarMessage(text: result.message ?? "")
                    
                    MDCSnackbarManager.default.show(message)
                }
                
                return Resource.fail(error: result)
            }
            else {
                if let data = response.data {
                    if APICaller.logs {
                        print("API Caller unknown form error response : \(String(data: data, encoding: .utf8) ?? "")")
                    }
                    
                }
                
                return Resource.fail()
            }
            
        }
        
    }
    
}
