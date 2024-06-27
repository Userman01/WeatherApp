//
//  MainRouter.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import Foundation

protocol MainRouterProtocol {
    
}

final class MainRouter: MainRouterProtocol {
    
    let viewController: MainViewControllerProtocol
    
    init(viewController: MainViewControllerProtocol) {
        self.viewController = viewController
    }
}
