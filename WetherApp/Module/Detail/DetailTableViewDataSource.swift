//
//  DetailTableViewDataSource.swift
//  WetherApp
//
//  Created by Петр Постников on 30.06.2024.
//

import UIKit

final class DetailTableViewDataSource: NSObject, UITableViewDataSource {
    
    
    var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel = DetailViewModel(rows: [])) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let rowType = viewModel.rows[safe: indexPath.row] else { return UITableViewCell() }
        switch rowType {
        case let .currentWeather(viewModel):
            let cell = tableView.dequeueReusableCellWithRegistration(type: DetailTableViewWeatherCell.self, indexPath: indexPath)
            cell.configure(with: viewModel)
            return cell
        case let .forecastForDays(viewModel):
            let cell = tableView.dequeueReusableCellWithRegistration(type: DetailTableForecastForDaysCell.self, indexPath: indexPath)
            cell.configure(with: viewModel)
            return cell
        }
    }
}

