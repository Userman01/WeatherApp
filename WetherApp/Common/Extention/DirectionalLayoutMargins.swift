//
//  DirectionalLayoutMargins.swift
//  WetherApp
//
//  Created by Петр Постников on 29.06.2024.
//

import UIKit

extension UIView {
    func setDirectionalLayoutMargins(_ margins: NSDirectionalEdgeInsets) {
        self.preservesSuperviewLayoutMargins = false
        self.directionalLayoutMargins = margins
    }
}
