//
//  DetailTableViewDelegate.swift
//  WetherApp
//
//  Created by Петр Постников on 30.06.2024.
//

import UIKit

final class DetailTableViewDelegate: NSObject, UITableViewDelegate {
    
    var viewModel: DetailViewModel
    weak var delegate: DetailViewControllerDelegate?
    
    init(viewModel: DetailViewModel = DetailViewModel(rows: [])) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
