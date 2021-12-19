//
//  AppDelegate.swift
//  JKQuickApp-iOS
//
//  Created by Jacky Liang on 2021/7/1.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

@main
//class AppDelegate: UIResponder,UIApplicationDelegate {
//
//    var window : UIWindow?

class AppDelegate: FlutterAppDelegate {

    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let tabbarVC = JKTabbarVC()
        
        window?.rootViewController = tabbarVC
        
        //flutter 相关测试代码
        JKFlutterAdapter.shared.config(pluginRegister: self)
        
        return true
    }

   


}

