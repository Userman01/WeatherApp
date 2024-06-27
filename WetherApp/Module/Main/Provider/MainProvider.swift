//
//  MainProvider.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import Foundation

final class MainProvider {
    
    var networkProvider: NetworkProviderProtocol = NetworkProvider()
    
    func getRequestWeather(searchText: String?, completion: @escaping (Result<MainModel, Error>) -> ()) {
        getRequestGeocoding(searchText: searchText) {[weak self] result in
            switch result {
            case let .success(results):
                guard let result = results.first,
                      let params = self?.getParametersRequestWeather(lat: result.lat, lon: result.lon)
                else { return }
                
                let url = self?.url(params: params,
                                    scheme: .https,
                                    host: .weather,
                                    path: .weather)
                self?.networkProvider.request(url: url,
                                              header: nil,
                                              httpMethod: .get,
                                              completion: completion)
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    private func getRequestGeocoding(searchText: String?, completion: @escaping (Result<[GeocodingAPIModelElement], Error>) -> ()) {
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
        param["lang"] = "ru"
        param["units"] = "metric"
        param["appid"] = APIKey.key
        return param
    }
    
    private func getParametersGeocoding(searchText: String?) -> [String: String] {
        var param: [String: String] = [:]
        param["q"] = searchText
        param["limit"] = String(1)
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
