//
//  MainDataFlow.swift
//  WetherApp
//
//  Created by Петр Постников on 29.06.2024.
//

import Foundation

enum MainDataFlow {
    enum SourcheResult {
        struct Request {
            let text: String
        }
        
        struct Response {
            let model: [GeocodingAPIModelElement]
        }
        
        struct ViewModel {
            let viewModel: MainViewModel
        }
    }
    
    enum Failure {
        struct Response {
            let error: Error
        }
        
        struct ViewModel {
            let errorMessage: String
        }
    }
    
    enum ResultWeather {
        struct Request {
            let lat: Double
            let lon: Double
        }
        
        struct Response {
            let model: MainModel
            let modelForecast: MainForecastForDaysModel
        }
    }
}
