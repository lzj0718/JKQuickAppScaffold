//
//  JKFlutterAdapter.swift
//  JKQuickApp-iOS
//
//  Created by Jacky Liang on 2021/11/20.
//

import Foundation
import Flutter

class JKFlutterAdapter : NSObject {
    
    static let shared = JKFlutterAdapter()
    
    lazy var flutterEngine = FlutterEngine(name: "jk_flutter_engine")
   
    
    private override init() {}
    
    override func copy() -> Any {
        return self
    }
    
    override func mutableCopy() -> Any {
        return self
    }
    
    /// 安装flutter环境
    public func setupFlutterAdapter() {
        
        flutterEngine.run()
        
    }
    
    
    /// 生成跳转Flutter的VC
    /// - Returns: VC
    public func generatorFlutterVC<T>(_ type:T.Type)  -> T  where T : FlutterViewController  {
        let vc =
            T(engine: flutterEngine, nibName: nil, bundle: nil)
        return vc
    }
    
    
}
