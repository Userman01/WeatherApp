//
//  MainInteractor.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import Foundation

protocol MainInteractorProtocol {
    func getRequestGeocoding(request: MainDataFlow.SourcheResult.Request)
    
    func getResultWeather(request: MainDataFlow.ResultWeather.Request)
}

final class MainInteractor: MainInteractorProtocol {
    
    weak var presenter: MainPresenterProtocol?
    private let network = MainProvider()
    
    private var resultWeather: Result<MainModel, any Error>?
    private var resultWeatherForecastForDays: Result<MainForecastForDaysModel, any Error>?
    
    func getRequestGeocoding(request: MainDataFlow.SourcheResult.Request) {
        network.getRequestGeocoding(searchText: request.text) { [weak self] result in
            switch result {
            case let .success(result):
                self?.presenter?.presentSourcheResult(response: MainDataFlow.SourcheResult.Response(model: result))
            case let .failure(error):
                self?.presenter?.presentFailure(response: MainDataFlow.Failure.Response(error: error))
            }
        }
    }
    
    func getResultWeather(request: MainDataFlow.ResultWeather.Request) {
        let dispathGroup = DispatchGroup()
        dispathGroup.enter()
        network.getRequestWeather(lat: request.lat, lon: request.lon) {[weak self] result in
            self?.resultWeather = result
            dispathGroup.leave()
        }
        dispathGroup.enter()
        network.getRequestWeatherForecastForDays(lat: request.lat, lon: request.lon) { [weak self] result in
            self?.resultWeatherForecastForDays = result
            dispathGroup.leave()
        }
        dispathGroup.notify(queue: .main) { [weak self] in
            switch (self?.resultWeather, self?.resultWeatherForecastForDays) {
            case let (.success(model), .success(modelForecast)):
                self?.presenter?.presentResultWeather(response: MainDataFlow.ResultWeather.Response(model: model, modelForecast: modelForecast))
            case let (.failure(error), .failure),
                let  (.failure(error), .success):
                self?.presenter?.presentFailure(response: MainDataFlow.Failure.Response(error: error))
            case let (.success, .failure(errorForecast)):
                self?.presenter?.presentFailure(response: MainDataFlow.Failure.Response(error: errorForecast))
            default:
                self?.presenter?.presentFailure(response: MainDataFlow.Failure.Response(error: NetworkError(errorMessage: "nil")))
            }
            
            
        }
    }
}
