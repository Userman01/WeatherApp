//
//  DetailInteractor.swift
//  WetherApp
//
//  Created by Петр Постников on 29.06.2024.
//

import Foundation

protocol DetailInteractorProtocol {
}

final class DetailInteractor: DetailInteractorProtocol {
    
    weak var presenter: DetailPresenterProtocol?
}
