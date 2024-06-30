//
//  UIColor.swift
//  WetherApp
//
//  Created by Петр Постников on 29.06.2024.
//

import UIKit

extension UIColor {
    static func dynamic(light: UIColor, dark: UIColor) -> UIColor {
        UIColor { $0.userInterfaceStyle == .dark ? dark : light }
    }
    
    static let backgroundColor = dynamic(light: .white, dark: .darkGray)
    
    static let secondColor = dynamic(light: .white, dark: .gray)
    
    static let balckWhiteColor = dynamic(light: .black, dark: .white)
}
