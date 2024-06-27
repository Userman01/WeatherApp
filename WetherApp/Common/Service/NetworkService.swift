//
//  NetworkService.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func request(url: URL?, 
                 httpMethod: String,
                 header: [String: String]?,
                 completion: @escaping (Result<Data?, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    func request(url: URL?,
                 httpMethod: String,
                 header: [String: String]?,
                 completion: @escaping (Result<Data?, Error>) -> Void) {
        guard let url = url else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = header
        request.httpMethod = httpMethod
        createDataTask(from: request, completion: completion).resume()
    }

    private func createDataTask(from request: URLRequest, completion: @escaping (Result<Data?, Error>) -> Void) -> URLSessionDataTask {
        URLSession.shared.dataTask(with: request) { data, responce, error in
            if let error {
                completion(.failure(error))
            } else {
                completion(.success(data))
            }
        }
    }
}
