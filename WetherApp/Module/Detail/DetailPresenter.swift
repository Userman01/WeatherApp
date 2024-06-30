//
//  DetailPresenter.swift
//  WetherApp
//
//  Created by Петр Постников on 29.06.2024.
//

import Foundation

protocol DetailPresenterProtocol: AnyObject {
    
    func presentDetail(request: DetailDataFlow.PresentDetail.Request)
}

final class DetailPresenter: DetailPresenterProtocol {
    
    weak var viewController: DetailViewControllerProtocol?
    
    private let interactor: DetailInteractorProtocol
    private let inModel: DetailInModel
    
    init(interactor: DetailInteractorProtocol, model: DetailInModel) {
        self.interactor = interactor
        self.inModel = model
    }
    
    func presentDetail(request: DetailDataFlow.PresentDetail.Request) {
        let model = inModel.model
        let modelForecast = inModel.modelForecast
        var cellTypes: [DetailViewModelCellType] = []
        cellTypes.append(.currentWeather(DetailCurrentWeatherViewModelCell(
            name: model.name,
            feelsLike: model.main.feelsLike,
            temp: model.main.temp,
            tempMin: model.main.tempMin,
            tempMax: model.main.tempMax,
            weatherDescription: model.weather.first?.description ?? "",
            windSpeed: model.wind.speed)))
        modelForecast.list.forEach { model in
            cellTypes.append(.forecastForDays(DetailforecastForDaysViewModelCell(
                dataAndTime: model.dtTxt,
                windSpeed: model.wind.speed,
                temp: model.main.temp,
                tempMin: model.main.tempMin,
                tempMax: model.main.tempMax,
                weatherDescription: model.weather.first?.description ?? "")))
        }
        viewController?.displayDetail(viewModel: DetailDataFlow.PresentDetail.ViewModel(viewModel: DetailViewModel(rows: cellTypes)))
    }
}
