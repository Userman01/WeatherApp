//
//  Double.swift
//  WetherApp
//
//  Created by Петр Постников on 30.06.2024.
//

import Foundation

extension Double {
    func toString() -> String {
        String(format: "%.2f", self)
    }
}
