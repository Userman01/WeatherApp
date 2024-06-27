//
//  MainPresenter.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import Foundation

protocol MainPresenterProtocol {
    
}

final class MainPresenter: MainPresenterProtocol {
    
    var viewController: MainViewControllerProtocol?
    var interactor: MainInteractorProtocol?
    var router: MainRouterProtocol?
}
