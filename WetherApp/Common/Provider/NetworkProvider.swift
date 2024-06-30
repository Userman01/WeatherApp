//
//  NetworkProvider.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import Foundation

protocol NetworkProviderProtocol {
    func request<T: Decodable>(url: URL?,
                                  header: [String: String]?,
                                  httpMethod: HttpMethod,
                                  completion: @escaping (Result<T, Error>) -> ())
}

final class NetworkProvider: NetworkProviderProtocol {
    
    var networkService: NetworkServiceProtocol = NetworkService()
    
    func request<T: Decodable>(url: URL?,
                               header: [String: String]?,
                               httpMethod: HttpMethod,
                               completion: @escaping (Result<T, Error>) -> ()) {
            networkService.request(url: url,
                                   httpMethod: httpMethod.rawValue,
                                   header: header) { [weak self] result in
                switch result {
                case let .success(data):
                    if let decode = self?.decodeJSON(type: T.self, data: data) {
                        completion(.success(decode))
                    } else {
                        completion(.failure(NetworkError(errorMessage: "Error decode")))
                    }
                    
                case let .failure(error):
                    completion(.failure(error))
                }
            }
        }
    
    private func decodeJSON<T: Decodable>(type: T.Type, data: Data?) -> T? {
        guard let data else { return nil }
        let decoder = JSONDecoder()
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let error {
            print(error)
            return nil
        }
    }
}
