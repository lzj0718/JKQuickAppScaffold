//
//  JKFlutterNavigationView.swift
//  JKQuickApp-iOS
//
//  Created by Jacky Liang on 2021/12/12.
//

import Foundation
import UIKit
import SnapKit

class JKFlutterNavigationView : UIView {
    
    var contentView:UIView?
    var leftBackBtn:UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        contentView = UIView()
        self.addSubview(contentView!)
        contentView?.backgroundColor = kRGBColorFromHex(0xB9EDFA)
        contentView?.snp.makeConstraints({ (make) in
            make.edges.equalToSuperview()
        })
        
        leftBackBtn = UIButton()
        contentView?.addSubview(leftBackBtn!)
        leftBackBtn?.setBackgroundImage(UIImage(named: "nav-back"), for: UIControl.State.normal)
        leftBackBtn?.snp.makeConstraints({ (make) in
            make.width.height.equalTo(30)
            make.centerY.equalToSuperview()
            make.left.equalTo(10)
        })
    }
}
