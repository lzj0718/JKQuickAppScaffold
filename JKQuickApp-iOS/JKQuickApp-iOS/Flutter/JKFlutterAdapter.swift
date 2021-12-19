//
//  JKFlutterAdapter.swift
//  JKQuickApp-iOS
//
//  Created by Jacky Liang on 2021/11/20.
//

import Foundation
import Flutter
import FlutterPluginRegistrant

let JKFlutter_Channel_Message = "tech.1126.flutter/native_get"
let JKFlutter_Channel_Event = "tech.1126.flutter/native_post"

class JKFlutterAdapter : NSObject , FlutterStreamHandler {
    
    static let shared = JKFlutterAdapter()
    
    private var flutterVC : JKFlutterViewController?
    
    private var eventSink : FlutterEventSink?
    
    private var handler : FlutterMethodCallHandler?
    
    private var messageChannel : FlutterMethodChannel?
    
    private var eventChannel : FlutterEventChannel?
    
    private var flutterEngine : FlutterEngine?
    
   
    override func copy() -> Any {
        return self
    }
    
    override func mutableCopy() -> Any {
        return self
    }
    
    
    private override init() {
        super.init()
    }
    
    /// 配置相关信息
    public func config(pluginRegister:FlutterPluginRegistry) {
        //插件注册
        GeneratedPluginRegistrant.register(with: pluginRegister)
        //安装适配器
        self.setupFlutterAdapter()
    }
    
    /// 安装flutter环境
    private func setupFlutterAdapter() {
        
        //创建引擎
        flutterEngine = FlutterEngine(name: "jk_flutter_engine")
        
        if let engine = flutterEngine , engine.run(withEntrypoint: nil) == true {
           
            //创建VC
            flutterVC = JKFlutterViewController(engine: engine, nibName: nil, bundle: nil)
            
            //创建接收消息渠道
            messageChannel = FlutterMethodChannel(name: JKFlutter_Channel_Message, binaryMessenger: flutterVC as! FlutterBinaryMessenger)
            messageChannel?.setMethodCallHandler {[weak self] (call, result) in
                print("call = \(call.method)")
                //先处理全局事件
                switch call.method {
                case JKFlutterMethodCallName.naviToBackNative:
                    //开启原生导航右滑返回手势
                    self?.flutterVC?.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
                    //返回原生
                    self?.flutterVC?.navigationController?.popViewController(animated: true)
                    return
                case JKFlutterMethodCallName.enablePopGestureRecognizer:
                    //开启原生导航右滑返回手势
                    self?.flutterVC?.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
                    return
                case JKFlutterMethodCallName.disablePopGestureRecognizer:
                    //屏蔽原生导航右滑返回手势
                    self?.flutterVC?.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
                    return
                default:
                    print("unmatch \(call.method)")
                    break
                }
                //未匹配全局事件，则传递给界面
                if let listenMessageCallResponse = self?.flutterVC?.listenMessageCallResponse,
                   let listenMessageChannels = self?.flutterVC?.listenMessageChannels , listenMessageChannels.contains(call.method){
                    listenMessageCallResponse(call,result)
                }
            }
            
            //创建发送消息渠道
            eventChannel = FlutterEventChannel(name: JKFlutter_Channel_Event, binaryMessenger: flutterVC as! FlutterBinaryMessenger )
            eventChannel?.setStreamHandler(self)
        }
        
    }
    
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink  = events
        return nil;
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        return nil;
    }
    
    
    
    
}


/// Flutter适配器相关公共API方法
extension JKFlutterAdapter {
    
    public func getFlutterVC(pageId:String,pageCache:Bool = true) -> JKFlutterViewController? {
        if let eventblock = eventSink , let vc = flutterVC {
            vc.pageId = pageId//pageCache ? pageId : "\(pageId)_\(Int64(Date().timeIntervalSince1970))"
            eventblock(vc.pageId)
            return vc
        }
        return nil
    }
    
    public func getFlutterVC(pageId:String,
                             pageCache:Bool = true,
                             listenMessageChannels:[String] = [],
                             listenMessageCallResponse: @escaping FlutterMethodCallHandler ) -> JKFlutterViewController? {
        if let eventblock = eventSink , let vc = flutterVC {
            vc.pageId = pageId//pageCache ? pageId : "\(pageId)_\(Int64(Date().timeIntervalSince1970))"
            eventblock(vc.pageId)
            vc.listenMessageChannels = listenMessageChannels
            vc.listenMessageCallResponse = listenMessageCallResponse
            return vc
        }
        return nil
    }
}
