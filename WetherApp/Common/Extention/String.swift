//
//  String.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import Foundation

extension String {
    enum Scheme: String {
        case http = "http"
        case https = "https"
    }
    
    enum Host: String {
        case weather = "api.openweathermap.org"
    }
    
    enum Path: String {
        case geocoding = "/geo/1.0/direct"
        case weather = "/data/2.5/weather"
        case forecast = "/data/2.5/forecast"
    }
}
