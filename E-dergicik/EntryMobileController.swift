//
//  EntryMobileController.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 18.10.2021.
//

import UIKit
import Resolver
import Alamofire
import MaterialComponents
import AuthenticationServices


class EntryMobileController: BaseController {
    
    @IBOutlet weak var entryMobile: UITextField!
    
    var purpose: CodePurpose = .signup
    @Injected var repo: AuthRepository
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        entryMobile.becomeFirstResponder()
        setDismissKeyboardView(dismisserView: self.view)
        
        // Do any additional setup after loading the view.
    }
    @IBAction func entryClicked(_ sender: Any) {
        attempSendCode()
        
    }
    
    func attempSendCode() {
        let mobile = entryMobile.text!
        repo.sendCode(request: SendCodeRequest(mobile: mobile, purpose: .signup)) { [self] result in
            if (result != nil) {
                let controller: VerifyCodeController = UIStoryboard.Storyboard.Main.controller(id: .verifyCodeController)
                controller.mobile = mobile
                self.navigationController?.pushViewController(controller, animated: true)
                
            }
        }
    }
}






    
