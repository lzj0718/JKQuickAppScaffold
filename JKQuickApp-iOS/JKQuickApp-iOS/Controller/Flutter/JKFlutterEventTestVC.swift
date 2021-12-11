//
//  JKFlutterEventTestVC.swift
//  JKQuickApp-iOS
//
//  Created by Jacky Liang on 2021/12/5.
//

import Foundation
import Flutter

//class JKFlutterEventTestVC : FlutterViewController{
//    
//    deinit {
//        print("deinit \(self)")
//    }
//    
//    var hitCount = 0
//    
//    lazy var methodChannel : FlutterMethodChannel = {
//        return FlutterMethodChannel(name: "tech.1126.flutter/count", binaryMessenger: JKFlutterAdapter.shared.flutterEngine.binaryMessenger)
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        methodChannel.setMethodCallHandler {[weak self] (call, result) in
//            switch call.method {
//            case "getBatteryLevel" :
//                self?.hitCount += 1
//                result(self?.hitCount)
//                break
//            default:
//                print("call.method=\(call.method)")
//                break
//            }
//        }
//    }
//}

