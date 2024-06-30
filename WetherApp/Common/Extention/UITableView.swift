//
//  UITableView.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import UIKit

extension UITableView {

    static func defaultReuseId(for elementType: UIView.Type) -> String {
        return String(describing: elementType)
    }

    func dequeueReusableHeaderFooterWithRegistration<T: UITableViewHeaderFooterView>(type: T.Type, reuseId: String? = nil) -> T {
        let normalizedReuseId = reuseId ?? UITableView.defaultReuseId(for: T.self)

        if let view = dequeueReusableHeaderFooterView(withIdentifier: normalizedReuseId) as? T {
            return view
        }

        register(type, forHeaderFooterViewReuseIdentifier: normalizedReuseId)

        return dequeueReusableHeaderFooterView(withIdentifier: normalizedReuseId) as! T
    }

    func dequeueReusableCellWithRegistration<T: UITableViewCell>(type: T.Type, indexPath: IndexPath, reuseId: String? = nil) -> T {
        let normalizedReuseId = reuseId ?? UITableView.defaultReuseId(for: T.self)

        if let cell = dequeueReusableCell(withIdentifier: normalizedReuseId) as? T {
            return cell
        }
        register(type, forCellReuseIdentifier: normalizedReuseId)

        // swiftlint:disable:next force_cast
        return dequeueReusableCell(withIdentifier: normalizedReuseId, for: indexPath) as! T
    }

    func removeSectionHeaderPadding() {
        if #available(iOS 15.0, *) {
            self.sectionHeaderTopPadding = 0.0
        }
    }
}
