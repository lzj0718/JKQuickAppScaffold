//
//  AppDelegate.swift
//  JKQuickApp-iOS
//
//  Created by Jacky Liang on 2021/7/1.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let tabbarVC = JKTabbarVC()
        
        window?.rootViewController = tabbarVC
        return true
    }

   


}

