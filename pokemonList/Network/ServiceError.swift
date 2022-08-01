//
//  ServiceError.swift
//  pokemonList
//
//  Created by Samuel Silva on 31/07/22.
//

import Foundation

enum ServiceError: Error {
    case unexpected
    case invalidURL
    case noConnection
    case decoding(data: Data)
    case other(String)
}

extension ServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noConnection:
            return "No Internet connection"
        case .unexpected:
            return "Something went wrong"
        case .decoding(data: let data):
            return "Decode error for data: \(data)"
        case .other(let message):
            return message
        }
    }
}

extension ServiceError {
    init(json: [String: Any]) {
        if let message =  json["message"] as? String {
            self = .other(message)
        } else {
            self = .unexpected
        }
    }
}
