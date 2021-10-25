//
//  UIStoryboard.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 19.10.2021.
//

import Foundation
import UIKit
import Alamofire

extension UIStoryboard {
    
    struct Storyboard {
        
        static let Main = UIStoryboard(name: "Main", bundle: Bundle.main)
       
        
    }
    func controller(identifier:String) -> UIViewController {
        return self.instantiateViewController(withIdentifier: identifier)
    }
    func controller<T:UIViewController>(id:StoryboardID) -> T {
        return self.instantiateViewController(withIdentifier: id.rawValue) as! T
    }
}
