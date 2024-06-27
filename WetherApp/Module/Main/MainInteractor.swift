//
//  MainInteractor.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import Foundation

protocol MainInteractorProtocol {
    
}

final class MainInteractor: MainInteractorProtocol {
    
    let presenter: MainPresenterProtocol
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
}
