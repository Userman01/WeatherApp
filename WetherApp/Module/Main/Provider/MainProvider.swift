//
//  MainProvider.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import Foundation

final class MainProvider {
    
    let networkProvider: NetworkProviderProtocol = NetworkProvider()
    
    func getRequestWeather(lat: Double, lon: Double, completion: @escaping (Result<MainModel, Error>) -> ()) {
        let params = getParametersRequestWeather(lat: lat, lon: lon)
        let url = url(params: params,
                      scheme: .https,
                      host: .weather,
                      path: .weather)
        networkProvider.request(url: url,
                                header: nil,
                                httpMethod: .get,
                                completion: completion)
    }
    
    func getRequestWeatherForecastForDays(lat: Double, lon: Double, completion: @escaping (Result<MainForecastForDaysModel, Error>) -> ()) {
        let params = getParametersWeatherForecastForDays(lat: lat, lon: lon)
        let url = url(params: params,
                      scheme: .https,
                      host: .weather,
                      path: .forecast)
        networkProvider.request(url: url,
                                header: nil,
                                httpMethod: .get,
                                completion: completion)
    }

    func getRequestGeocoding(searchText: String?, completion: @escaping (Result<[GeocodingAPIModelElement], Error>) -> ()) {
        let params = getParametersGeocoding(searchText: searchText)
        let url = url(params: params,
                      scheme: .http,
                      host: .weather,
                      path: .geocoding)
        networkProvider.request(url: url,
                                header: nil,
                                httpMethod: .get,
                                completion: completion)
    }
    
    private func getParametersRequestWeather(lat: Double, lon: Double) -> [String: String] {
        var param: [String: String] = [:]
        param["lat"] = String(lat)
        param["lon"] = String(lon)
        param["lang"] = LocationType.ru
        param["units"] = "metric"
        param["appid"] = APIKey.key
        return param
    }
    
    private func getParametersGeocoding(searchText: String?) -> [String: String] {
        var param: [String: String] = [:]
        param["q"] = searchText
        param["limit"] = String(5)
        param["appid"] = APIKey.key
        return param
    }
    
    private func getParametersWeatherForecastForDays(lat: Double, lon: Double) -> [String: String] {
        var param: [String: String] = [:]
        param["lat"] = String(lat)
        param["lon"] = String(lon)
        param["lang"] = LocationType.ru
        param["units"] = "metric"
        param["cnt"] = "24"
        param["appid"] = APIKey.key
        return param
    }
    
    private func url(params: [String: String],
                     scheme: String.Scheme,
                     host: String.Host,
                     path:String.Path) -> URL? {
        var components = URLComponents()
        components.scheme = scheme.rawValue
        components.host = host.rawValue
        components.path = path.rawValue
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        return components.url
    }
}
