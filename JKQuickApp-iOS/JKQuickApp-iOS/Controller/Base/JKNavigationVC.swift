//
//  JKNavigationVC.swift
//  JKQuickApp-iOS
//
//  Created by Jacky Liang on 2021/11/20.
//

import Foundation
import UIKit

class JKNavigationVC: UINavigationController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self
        interactivePopGestureRecognizer?.isEnabled = false
        modalPresentationStyle = .fullScreen
    
    }
    override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            interactivePopGestureRecognizer?.isEnabled = true
        }else{
            interactivePopGestureRecognizer?.isEnabled = false
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    // fix iOS14 POP导航隐藏问题
   override public func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        if #available(iOS 14.0, *) {
            if self.viewControllers.count > 1 {
                self.topViewController?.hidesBottomBarWhenPushed = false
            }
        }
        return super.popToViewController(viewController, animated: animated)
    }
    
    // fix iOS14 POP导航隐藏问题
    override public func popToRootViewController(animated: Bool) -> [UIViewController]? {
       if #available(iOS 14.0, *) {
           if self.viewControllers.count > 1 {
               self.topViewController?.hidesBottomBarWhenPushed = false
           }
       }
       return super.popToRootViewController(animated: animated)
    }
}

extension JKNavigationVC:UIGestureRecognizerDelegate
{
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count > 1
    }
}
