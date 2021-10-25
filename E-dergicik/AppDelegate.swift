//
//  AppDelegate.swift
//  E-dergicik
//
//  Created by Oğuzhan Bilgiç on 11.10.2021.
//

import UIKit
import Resolver




@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    
    @LazyInjected var authRepo : AuthRepository
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        KFit.DECODING_DATE_FORMATS = ["yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd'T'HH:mm:ss.SSZ"]

        
        DataModule.registerServices()
        return true
    }
    
//    public func setRootViewController(controller:UIViewController) {
//
//        UIView.transition(with: self.window!, duration: 0.5, options: .transitionCrossDissolve, animations: {
//            let oldState: Bool = UIView.areAnimationsEnabled
//            UIView.setAnimationsEnabled(false)
//            self.window!.rootViewController = controller
//            UIView.setAnimationsEnabled(oldState)
//        }, completion: { (finished: Bool) -> () in
//
//        })
//    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        let tokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
//        print("APNS token: \(tokenString)")
//    }


}

