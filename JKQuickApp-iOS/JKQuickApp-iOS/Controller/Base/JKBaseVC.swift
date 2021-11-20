//
//  JKBaseVC.swift
//  JKQuickApp-iOS
//
//  Created by Jacky Liang on 2021/11/20.
//

import Foundation
import UIKit

class JKBaseVC: UIViewController {
    
    override func loadView() {
        super.loadView()
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
    }
}
