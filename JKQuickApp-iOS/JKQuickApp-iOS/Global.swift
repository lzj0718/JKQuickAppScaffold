//
//  Global.swift
//  JKQuickApp-iOS
//
//  Created by Jacky Liang on 2021/12/12.
//
import UIKit
import Foundation


func kRGBColorFromHex(_ rgbValue: Int) -> UIColor {
    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
                 green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
                  blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
                 alpha: 1.0)
}

