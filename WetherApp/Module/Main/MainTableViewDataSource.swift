//
//  MainDataSource.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import UIKit

final class MainTableViewDataSource: NSObject, UITableViewDataSource {
    
    
    var viewModel: MainViewModel
    
    init(viewModel: MainViewModel = MainViewModel(rows: [])) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let rowType = viewModel.rows[safe: indexPath.row] else { return UITableViewCell() }
        switch rowType {
        case let .sourcheText(viewModel):
            let cell = tableView.dequeueReusableCellWithRegistration(type: MainTableViewTextCell.self, indexPath: indexPath)
            cell.configure(with: viewModel)
            return cell
        case let .sourcheTitle(viewModel):
            let cell = tableView.dequeueReusableCellWithRegistration(type: MainTableViewTitleCell.self, indexPath: indexPath)
            cell.configure(with: viewModel)
            return cell
        }
    }
}
