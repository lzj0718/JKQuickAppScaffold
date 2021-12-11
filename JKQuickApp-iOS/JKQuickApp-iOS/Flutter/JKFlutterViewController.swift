//
//  JKFlutterViewController.swift
//  JKQuickApp-iOS
//
//  Created by Jacky Liang on 2021/12/5.
//

import Foundation
import Flutter

class JKFlutterViewController : FlutterViewController {
    
    deinit {
        print("deinit JKFlutterViewController")
    }
    
    //页面ID
    var pageId : String = ""
    
    //定义需要监听的消息列表
    var listenMessageChannels : [String] = []
    
    //定义监听的消息回调
    var listenMessageCallResponse : FlutterMethodCallHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
