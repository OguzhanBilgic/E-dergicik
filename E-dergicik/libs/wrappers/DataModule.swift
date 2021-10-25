//
//  DataModule.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 13.10.2021.
//

import Foundation
import Resolver

class DataModule {
    
    static func registerServices() {
        
        Resolver.register { APICaller() }.scope(.shared)
        
        registerAuthRepo()
        
        
    }
    static func registerAuthRepo() {

            Resolver.register { AuthAPIService() }.scope(.shared)
            Resolver.register { AuthRemoteDataSource() }.scope(.shared)
            Resolver.register { AuthLocalDataSource() }.scope(.shared)
            Resolver.register { AuthRepository() }.scope(.shared)
        }
}


