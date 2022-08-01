//
//  ApiConstants.swift
//  pokemonList
//
//  Created by Samuel Silva on 31/07/22.
//

import Foundation

enum K {
    enum API {
        enum Endpoint {
            case pokemons(offset: Int)
            case pokemon(id: String)
            
            private var path: String {
                switch self {
                case .pokemons(_):
                    return "/pokemon"
                case .pokemon(let id):
                    return "/pokemon/".appending(id)
                }
            }
            
            private var query: [URLQueryItem]? {
                switch self {
                case .pokemons(let offset):
                    return [URLQueryItem(name: "offset", value: "\(offset)"), URLQueryItem(name: "limit", value: "20")]
                default:
                    return nil
                }
            }
            
            var url: URL? {
                var urlComponents = URLComponents()
                urlComponents.scheme = "https"
                urlComponents.host = "pokeapi.co"
                urlComponents.path = "/api/v2".appending(path)
                urlComponents.queryItems = query
                return urlComponents.url
            }
        }
    }
}
