//
//  MainNavigationController.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 24.10.2021.
//

import UIKit


class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainNavigationController.shared = self
        
    }
    
    public static var shared: MainNavigationController?
}

