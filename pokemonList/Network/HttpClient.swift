//
//  HttpClient.swift
//  pokemonList
//
//  Created by Samuel Silva on 31/07/22.
//

import Foundation

final class HttpClient {
    static func request<T: Decodable>(url: URL?, completion: @escaping (Result<T, ServiceError>) -> ()) {
        guard let url = url else {
            completion(.failure(.invalidURL))
            return
        }
        
        guard Reachability.isConnectedToNetwork() else {
            completion(.failure(ServiceError.noConnection))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.other(error.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.unexpected))
                return
            }
            
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.decoding(data: data)))
                }
            }
        }
        
        task.resume()
    }
}
