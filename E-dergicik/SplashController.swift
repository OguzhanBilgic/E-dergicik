//
//  SplashController.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 13.10.2021.
//

import UIKit
import Resolver

class SplashController: UIViewController {

    @Injected var authRepo: AuthRepository
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkSession()
       
    }
    
    func checkSession() {
        authRepo.createGuest {
            result in
            if let _ = result {
                self.authRepo.loginGuest {
                    info in
                    if let _ = info {
                        let controller: EntryMobileController = UIStoryboard.Storyboard.Main.controller(id: .entryMobileController)
                        self.navigationController?.pushViewController(controller, animated: true)
                        
                    }
                }
            }
        }
    }
}
