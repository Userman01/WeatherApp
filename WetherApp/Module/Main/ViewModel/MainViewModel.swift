//
//  MainViewModel.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import Foundation

struct MainViewModel {
    let rows: [MainViewModelCellType]
}

enum MainViewModelCellType {
    case sourcheText(MainViewModelCell)
    case sourcheTitle(MainViewModelCell)
}

struct MainViewModelCell {
    let name: String
    let country: String
    let state: String
    let lat: Double
    let lon: Double
}
