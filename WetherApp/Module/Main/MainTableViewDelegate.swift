//
//  MainTableViewDelegate.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import UIKit

final class MainTableViewDelegate: NSObject, UITableViewDelegate {
    
    var viewModel: MainViewModel
    weak var delegate: MainViewControllerDelegate?
    
    init(viewModel: MainViewModel = MainViewModel(rows: [])) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let rowType = viewModel.rows[safe: indexPath.row] else { return }
        switch rowType {
        case let .sourcheText(viewModel):
            delegate?.didSelectCell(lat: viewModel.lat, lon: viewModel.lon)
        case .sourcheTitle:
            return
        }
    }
}
