//
//  MainRouter.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import UIKit

protocol MainRouterProtocol {
    
    func presentDetailWeather(model: MainModel, modelForecast: MainForecastForDaysModel)
}

final class MainRouter: MainRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func presentDetailWeather(model: MainModel, modelForecast: MainForecastForDaysModel) {
        let vc = DetailBuilder()
            .set(model: model, modelForecast: modelForecast)
            .build()
        viewController?.present(vc, animated: true)
    }
}
