//
//  APICallInterceptor.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import Foundation
import Alamofire
import Resolver

public class APICallInterceptor : Alamofire.RequestInterceptor {
    
    @LazyInjected var repo : AuthRepository
    
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        var request = urlRequest
        
        
        request.setValue(repo.getAccount()?.id ?? "", forHTTPHeaderField: "userId")
        
        if repo.gotSession() {
            request.setValue("Bearer \(repo.getSession()?.token ?? "")", forHTTPHeaderField: "Authorization")
        }
        
        print("APICaller : \(urlRequest.url?.absoluteString ?? "")")
        print("APICaller bearer : \(repo.getSession()?.token ?? "")")
        print("APICaller userId : \(repo.getAccount()?.id ?? "")")
        completion(.success(request))
    }
    
    
    
    
    
    
    public func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        
        if APICaller.logs {
            print("Interceptor retry : \(request.request?.url?.absoluteString ?? "") status : \(request.response?.statusCode ?? -1)  task status : \((request.task?.response as? HTTPURLResponse)?.statusCode ?? -1)")
        }
        
        
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else { // if the issue is not about authorization, retry the request up to 3 times
            
            /*
             let r = request.task?.response as? HTTPURLResponse
             print("Interceptor pre-retry response : \(r?.description ?? "")")
             */
            
            if let originalRequestBodyData = request.task?.originalRequest?.httpBody {
                if APICaller.logs {
                    print("Interceptor pre-retry original request body : \(String(data: originalRequestBodyData, encoding: .utf8) ?? "")")
                }
                
            }
            
            if [404,400,422,405,406,409,410,429,500].contains(request.response?.statusCode ?? 0) {
                return completion(.doNotRetryWithError(error))
            }
            
            if request.retryCount < 2 {
                return completion(.retry)
            }
            else {
                return completion(.doNotRetryWithError(error))
            }
        }
        
        
        
        //        if isEndpointRetriable(endpoint: request.request?.url?.absoluteString ?? "") {
        //
        //            if request.retryCount < 2 {
        //
        //                if !repo.isRenewingSession() {
        //                    repo.refreshToken(request: RefreshTokenRequest(refreshToken: repo.getSession()?.refreshToken ?? "")) { result in
        //                        if result != nil {
        //                            return completion(.retry)
        //                        }
        //                        else {
        //                            self.fallbackToLoginIfNecessary()
        //                            return completion(.doNotRetry)
        //                        }
        //                    }
        //                }
        //                else {
        //                    return completion(.retryWithDelay(2.0))
        //                }
        //            }
        //            else {
        //                return completion(.doNotRetryWithError(error))
        //            }
        //        }
        //        else {
        //            return completion(.doNotRetryWithError(error))
        //        }
        //
        
    }
    
    func isEndpointRetriable(endpoint:String) -> Bool {
        
        let noretryEndpoints : [String] = [
            "\(BuildConfig.BASE_URL)/api/session/refresh-token",
            "\(BuildConfig.BASE_URL)/api/login/log-in"
        ]
        
        for ep in noretryEndpoints {
            if ep == endpoint {
                return false
            }
        }
        
        return true
        
    }
    
    func fallbackToLoginIfNecessary() {
        /*if ConnectionManager.isConnectedToNetwork() {
         
         self.repo.fallbackToGuestSession { success in
         if success {
         DispatchQueue.main.async {
         UIApplication.shared.fallbackToLogin()
         }
         }
         else {
         self.fallbackToSplash()
         }
         }
         }*/
    }
    
    func fallbackToSplash() {
        /*DispatchQueue.main.async {
         UIApplication.shared.fallbackToSplash()
         }*/
    }
    //    if request.request?.url?.absoluteString != "\(BuildConfig.BASE_URL)/api/session/refresh-token" {
    //        if request.retryCount < 2 {
    //
    //            if !repo.isRenewingSession() {
    //                repo.refreshToken(request: RefreshTokenRequest(refreshToken: repo.getSession()?.refreshToken ?? "")) { result in
    //                    if result != nil {
    //                        return completion(.retry)
    //                    }
    //                    else {
    //                        self.fallbackToLoginIfNecessary()
    //                        return completion(.doNotRetry)
    //                    }
    //                }
    //            }
    //            else {
    //                return completion(.retryWithDelay(2.0))
    //            }
    //        }
    //        else {
    //            return completion(.doNotRetryWithError(error))
    //        }
    //    }
    //    else {
    //        return completion(.doNotRetryWithError(error))
    //    }
    
}


