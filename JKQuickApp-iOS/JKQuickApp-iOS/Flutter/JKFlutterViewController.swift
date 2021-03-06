//
//  JKFlutterViewController.swift
//  JKQuickApp-iOS
//
//  Created by Jacky Liang on 2021/12/5.
//

import Foundation
import Flutter
import SnapKit

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //隐藏原来导航
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //显示原来导航
        navigationController?.navigationBar.isHidden = false
    }
    
        
}
