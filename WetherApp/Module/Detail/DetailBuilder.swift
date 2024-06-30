//
//  DetailBuilder.swift
//  WetherApp
//
//  Created by Петр Постников on 29.06.2024.
//

import UIKit

final class DetailBuilder {
    
    private var inModel: DetailInModel?
    
    func set(model: MainModel, modelForecast: MainForecastForDaysModel) -> DetailBuilder {
        self.inModel = DetailInModel(model: model, modelForecast: modelForecast)
        return self
    }
    
    func build() -> UIViewController {
        guard let inModel else { fatalError("add inModel") }
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(interactor: interactor, model: inModel)
        let viewController = DetailViewController(presenter: presenter)
        interactor.presenter = presenter
        presenter.viewController = viewController
        return viewController
    }
}
