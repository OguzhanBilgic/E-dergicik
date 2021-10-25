//
//  VerifyCodeController.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 14.10.2021.
//

import UIKit
import OTPFieldView
import Resolver
import MaterialComponents

class VerifyCodeController: BaseController {
    
    @Injected var repo: AuthRepository
    
    var purpose : CodePurpose = .verify
    var codeInput : String = ""
    var mobile : String?
    var password : String?
    var email : String?
    
    
    @IBOutlet weak var codeView: OTPFieldView!
    
    
    override func layout() {
        super.layout()
        
        setDismissKeyboardView(dismisserView: self.view)
        self.codeView.fieldsCount = 5
        self.codeView.fieldBorderWidth = 2
        self.codeView.defaultBorderColor = UIColor.black
        self.codeView.filledBorderColor = UIColor.green
        self.codeView.cursorColor = UIColor.red
        self.codeView.displayType = .underlinedBottom
        self.codeView.fieldSize = 50
        self.codeView.separatorSpace = 10
        self.codeView.delegate = self
        self.codeView.initializeUI()
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        
    }
    @IBAction func continueTapped(_ sender: Any) {
        attempVerify()
        print(purpose,"VERIFYCODE")
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpController") as? SignUpController
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    func attempVerify() {
        switch purpose {
        case .verify:
            attemptVerifyCode()
            break
        default:
            return
            
        }
    }
    
    func attemptVerifyCode() {
        let codeInput = self.codeInput
        repo.verifyCode(request: VerifyCodeRequest(mobile: mobile, purpose: .verify, code: codeInput)) { [self] result in
            if result {
                let controller: SignUpController = UIStoryboard.Storyboard.Main.controller(id: .signUpController)
                controller.codeInput = codeInput
                controller.mobile = mobile
                self.navigationController?.pushViewController(controller, animated: true)
//                let request = VerifyCodeRequest(mobile: mobile, purpose: .passwordRecovery, code: codeInput)
//                
//                repo.verifyCode(request: request) { (isSuccess) in
//                    
//                }
                
            }
        }
    }
    
    //    func verifyForSignUp() {
    //
    //        repo.verifyCode(request: VerifyCodeRequest(mobile: mobile, purpose: .signup, code: codeInput ?? "")) { response in
    //            if (response) {
    //                let request = SignUpRequest(mobile: self.mobile, password: self.password, email: self.email, code: self.codeInput)
    //                self.repo.signUp(request: request) { result in
    //                    print("Result:", result ?? "")
    //                    self.performSegue(withIdentifier: "toSignUp", sender: nil)
    //                    let controller: SignUpController = UIStoryboard.Auth.controller(id: .signUpController)
    //                    controller.code = self.codeInput
    //                    controller.mobileNumber = self.mobile
    //                    self.navigationController?.pushViewController(controller, animated: true)
    //                }
    //            }
    //        }
    //    }
    
    //    override func layOut() {
    //        super.layout()
    //
    //        if self.purpose == .signup {
    //
    //        }
    //        else if self.purpose == .login {
    //
    //        }
    //        else if self.purpose == .updatePassword {
    //
    //        }
    //        else if self.purpose == .passwordRecovery {
    //
    //        }
}


extension VerifyCodeController : OTPFieldViewDelegate {
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp: String) {
        print("OTPString: \(otp)")
        codeInput = otp
        attempVerify()
        
    }
    
    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        print("Has entered all OTP? \(hasEnteredAll)")
        return hasEnteredAll
    }
    
}
