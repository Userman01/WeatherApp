//
//  DetailViewModel.swift
//  WetherApp
//
//  Created by Петр Постников on 29.06.2024.
//

import Foundation

struct DetailViewModel {
    let rows: [DetailViewModelCellType]
}

enum DetailViewModelCellType {
    case currentWeather(DetailCurrentWeatherViewModelCell)
    case forecastForDays(DetailforecastForDaysViewModelCell)
}

struct DetailCurrentWeatherViewModelCell {
    let name: String
    let feelsLike: Double
    let temp: Double
    let tempMin: Double
    let tempMax: Double
    let weatherDescription: String
    let windSpeed: Double
}

struct DetailforecastForDaysViewModelCell {
    let dataAndTime: String
    let windSpeed: Double
    let temp: Double
    let tempMin: Double
    let tempMax: Double
    let weatherDescription: String
}
