//
//  LoginController.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 16.10.2021.
//

import UIKit
import Resolver
import MaterialComponents

class LoginController: BaseController {
    
    @IBOutlet weak var mobileTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    @Injected var repo: AuthRepository
    // var purpose: CodePurpose = .login
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func loginClicked(_ sender: Any) {
        attepmtLogin()
        
    }
    
    
    func attepmtLogin() {
        let mobile = mobileTxt.text
        let password = passwordTxt.text
        
        let request = LoginRequest(mobile: mobile, password: password ?? "")
        print(request,"LoginRequest")
        repo.login(request: request) { (result) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "formController") as? FormController
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
        
    }
    
}
