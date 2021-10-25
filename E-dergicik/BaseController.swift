//
//  BaseController.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 17.10.2021.
//

import UIKit

class BaseController: UIViewController {
    
    var disabledViews : Array<UIView> = Array()
    var textFieldsInOrder : Array<UITextField>? = Array()

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    public func layout() {
        
    }
    
    func setDismissKeyboardView(dismisserView:UIView,cancels:Bool? = nil) {
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BaseController.removeKeyboard))
        if cancels != nil {
            tap.cancelsTouchesInView = cancels!
        }
        dismisserView.addGestureRecognizer(tap)
    }
    
    @objc func removeKeyboard() {
        self.view.endEditing(true )
    }
    
    public func shouldClearReferences() {
        NotificationCenter.default.removeObserver(self)
    }

    
    func disableViews(views:UIView...) {
        self.disabledViews = views
        for view in views {
            view.alpha = 0.5
            view.isUserInteractionEnabled = false
        }
    }
    
    
    func nextResponder(returnedField:UITextField) {
        if textFieldsInOrder != nil {
            for i in 0..<(textFieldsInOrder?.count ?? 0) {
                let field : UITextField! = textFieldsInOrder?[i]
                if field === returnedField && i < (textFieldsInOrder?.count ?? 0 - 1){
                    if textFieldsInOrder?.count ?? 0 > (i+1) {
                        let nextField : UITextField! = textFieldsInOrder?[i+1]
                        nextField.becomeFirstResponder()
                    }
                    
                    break
                }
            }
        }
    }
  
}
