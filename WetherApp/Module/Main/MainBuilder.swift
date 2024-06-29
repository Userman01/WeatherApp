//
//  MainBuilder.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import UIKit

final class MainBuilder {
    
    func build() -> UIViewController {
        let presenter = MainPresenter()
        let interactor = MainInteractor(presenter: presenter)
        let viewController = MainViewController(presenter: presenter)
        let router = MainRouter(viewController: viewController)
        presenter.viewController = viewController
        presenter.interactor = interactor
        presenter.router = router
        return viewController
    }
}
