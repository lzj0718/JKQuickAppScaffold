//
//  JKFlutterChannelHandler.swift
//  JKQuickApp-iOS
//
//  Created by Jacky Liang on 2021/12/11.
//

import Foundation
import Flutter


//let JKFlutter_Channel_Message = "tech.1126.flutter/native_get"
//let JKFlutter_Channel_Event = "tech.1126.flutter/native_post"
//
//
//class JKFlutterChannelHandler : NSObject , FlutterStreamHandler {
//    
//    var messageChannel : FlutterMethodChannel?
//    
//    var eventChannel : FlutterEventChannel?
//    
//    var eventSink : FlutterEventSink?
//    
//    var flutterVC : JKFlutterViewController?
//    
//    func setupFlutterVC(vc:JKFlutterViewController) {
//        print(">>>IOS setupFlutterVC")
//        flutterVC = vc
//        //创建接收消息渠道
//        messageChannel = FlutterMethodChannel(name: JKFlutter_Channel_Message, binaryMessenger: flutterVC as! FlutterBinaryMessenger)
//        messageChannel?.setMethodCallHandler {[weak self] (call, result) in
//            print(">>>IOS MethodCallHandler: call(method:\(call.method),arguments:\(call.arguments ?? ""))")
//            if let listenMessageCallResponse = self?.flutterVC?.listenMessageCallResponse,
//               let listenMessageChannels = self?.flutterVC?.listenMessageChannels , listenMessageChannels.contains(call.method){
//                listenMessageCallResponse(call,result)
//            }
//        }
//        
//        //创建发送消息渠道
//        eventChannel = FlutterEventChannel(name: JKFlutter_Channel_Event, binaryMessenger: flutterVC as! FlutterBinaryMessenger )
//        eventChannel?.setStreamHandler(self)
//    }
//    
//    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
//        print(">>>IOS EventSink: events = \(String(describing: events))")
//        self.eventSink  = events
//        self.eventSink?(flutterVC?.pageId)
//        return nil;
//    }
//    
//    func onCancel(withArguments arguments: Any?) -> FlutterError? {
//        print(">>>IOS EventSink: onCancel")
//        return nil;
//    }
//}
