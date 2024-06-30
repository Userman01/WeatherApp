//
//  MainBuilder.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import UIKit

final class MainBuilder {
    
    func build() -> UIViewController {
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(interactor: interactor, router: router)
        let viewController = MainViewController(presenter: presenter)
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
