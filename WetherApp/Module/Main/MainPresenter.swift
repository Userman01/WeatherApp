//
//  MainPresenter.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    
    func getSourcheResult(request: MainDataFlow.SourcheResult.Request)
    
    func presentSourcheResult(response: MainDataFlow.SourcheResult.Response)
    
    func presentFailure(response: MainDataFlow.Failure.Response)
    
    func getResultWeather(request: MainDataFlow.ResultWeather.Request)
    
    func presentResultWeather(response: MainDataFlow.ResultWeather.Response)
}

final class MainPresenter: MainPresenterProtocol {
    
    weak var viewController: MainViewControllerProtocol?
    
    private let interactor: MainInteractorProtocol
    private let router: MainRouterProtocol
    
    init(interactor: MainInteractorProtocol, router: MainRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func getSourcheResult(request: MainDataFlow.SourcheResult.Request) {
        interactor.getRequestGeocoding(request: request)
    }
    
    func presentSourcheResult(response: MainDataFlow.SourcheResult.Response) {
        var rowType: [MainViewModelCellType] = []
        rowType.append(.sourcheTitle(MainViewModelCell(name: "Name", country: "Country", state: "State", lat: .zero, lon: .zero)))
        response.model.forEach { element in
            let name: String
            if let locationName = element.localNames?[LocationType.ru] {
                name = locationName
            } else {
                name = element.name
            }
            rowType.append(.sourcheText(MainViewModelCell(name: name, country: element.country, state: element.state, lat: element.lat, lon: element.lon)))
        }
        viewController?.displaySourcheResult(viewModel: MainDataFlow.SourcheResult.ViewModel(viewModel: MainViewModel(rows: rowType)))
    }
    
    func presentFailure(response: MainDataFlow.Failure.Response) {
        let message: String
        if let error = response.error as? NetworkError {
            message = error.errorMessage
        } else {
            message = response.error.localizedDescription
        }
        viewController?.displayFailure(viewModel: MainDataFlow.Failure.ViewModel(errorMessage: message))
    }
    
    func getResultWeather(request: MainDataFlow.ResultWeather.Request) {
        interactor.getResultWeather(request: MainDataFlow.ResultWeather.Request(lat: request.lat, lon: request.lon))
    }
    
    func presentResultWeather(response: MainDataFlow.ResultWeather.Response) {
        DispatchQueue.main.async { [weak self] in
            self?.router.presentDetailWeather(model: response.model, modelForecast: response.modelForecast)
        }
    }
}
