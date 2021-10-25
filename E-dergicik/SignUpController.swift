//
//  SignUpController.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 14.10.2021.
//

import UIKit
import Resolver
import Alamofire
import MaterialComponents
import AuthenticationServices


class SignUpController: UIViewController {
    
    @Injected var authRepo: AuthRepository
    
    var mobile : String?
    var codeInput : String? = ""
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var code: UITextField!
    
    var purpose: CodePurpose = .login
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func ContinueClick(_ sender: Any) {
        attemptSignUp()
        
        
    }
    @IBAction func loginClicked(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginController") as? LoginController
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    func attemptSignUp() {
        let password = password.text
        let number = mobile
        let email = email.text
        let code = codeInput
        
        let request = SignUpRequest(mobile: number, password: password, email: email, code: code)
        authRepo.signUp(request: request) { (result) in
            let controller : LoginController =
            UIStoryboard.Storyboard.Main.controller(id: .loginController)
            self.navigationController?.pushViewController(controller, animated: true)
            
        }
        
        //print(result)
        
        
    }
    
}


