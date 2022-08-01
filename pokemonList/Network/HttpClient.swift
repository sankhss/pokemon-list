//
//  HttpClient.swift
//  pokemonList
//
//  Created by Samuel Silva on 31/07/22.
//

import Foundation

final class HttpClient {
    static func request<T: Decodable>(url: URL?, completion: @escaping (Result<T, ServiceError>) -> ()) {
        getData(url: url) { result in
            switch result {
            case .success(let data):
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedData))
                    } catch {
                        completion(.failure(.decoding(data: data)))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func getData(url: URL?, completion: @escaping (Result<Data?, ServiceError>) -> ()) {
        guard let url = url else {
            completion(.failure(.invalidURL))
            return
        }
        
        guard Reachability.isConnectedToNetwork() else {
            completion(.failure(ServiceError.noConnection))
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                completion(.failure(.other(error.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.unexpected))
                return
            }
            
            completion(.success(data))
        }).resume()
    }
}
