//
//  JKTabbarVC.swift
//  JKQuickApp-iOS
//
//  Created by Jacky Liang on 2021/11/20.
//

import Foundation
import UIKit

class JKTabbarVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetTabbarView()
        
        let homeVC = JKHomeVC()
        let homeNavVC = JKNavigationVC(rootViewController: homeVC)
        homeVC.tabBarItem.title = "首页"
        homeVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: CGFloat(14))], for: .normal)
        homeVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: CGFloat(14))], for: .selected)
        homeVC.tabBarItem.image = UIImage(named: "tabbar-home-n")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        homeVC.tabBarItem.selectedImage = UIImage(named: "tabbar-home-s")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        let centerVC = JKUserCenterVC()
        let centerNavVC = JKNavigationVC(rootViewController: centerVC)
        centerVC.tabBarItem.title = "个人中心"
        centerVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: CGFloat(14))], for: .normal)
        centerVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: CGFloat(14))], for: .selected)
        centerVC.tabBarItem.image = UIImage(named: "tabbar-center-n")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        centerVC.tabBarItem.selectedImage = UIImage(named: "tabbar-center-s")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        self.viewControllers = [homeNavVC,centerNavVC]
        
    }
    
    func resetTabbarView() {
        let tabBar = { () -> ActionTabBar in
            let tabBar = ActionTabBar()
            return tabBar
        }()
        
        // 去掉 tabBar 顶部 黑线
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.00).cgColor
        tabBar.clipsToBounds = true
        
        self.setValue(tabBar, forKey: "tabBar")
        
        UITabBar.appearance().tintColor =  UIColor.init(red: 16 / 255.0, green: 92 / 255.0, blue: 251 / 255.0, alpha: 1.0)
        if #available(iOS 10.0, *) {
            UITabBar.appearance().unselectedItemTintColor = UIColor.init(red: 51 / 255.0, green: 51 / 255.0, blue: 51 / 255.0, alpha: 1.0)
        }
        
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().backgroundImage = UIImage()
    }
}

class ActionTabBar: UITabBar {
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set {
            var tmp = newValue
            if let superview = self.superview, tmp.maxY != superview.frame.height {
                tmp.origin.y = superview.frame.height - tmp.height
            }
            super.frame = tmp
        }
    }
    
    //让图片和文字在iOS11下仍然保持上下排列
    override open var traitCollection: UITraitCollection {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return UITraitCollection(horizontalSizeClass: .compact)
        }
        return super.traitCollection
    }
}
