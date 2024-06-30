//
//  MainForecastForDaysModel.swift
//  WetherApp
//
//  Created by Петр Постников on 30.06.2024.
//

import Foundation

// MARK: - MainForecastForDaysModel
struct MainForecastForDaysModel: Codable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - List
struct List: Codable {
    let dt: Int
    let main: MainForecastForDays
    let weather: [Weather]
    let clouds: Clouds
    let wind: WindForecastForDays
    let visibility: Int
    let pop: Double
    let rain: Rain?
    let sys: SysForecastForDays
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, rain, sys
        case dtTxt = "dt_txt"
    }
}


// MARK: - Main
struct MainForecastForDays: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Sys
struct SysForecastForDays: Codable {
    let pod: String
}

// MARK: - Wind
struct WindForecastForDays: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}
