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
            case pokemons
            case pokemon(id: String)
            
            private var path: String {
                switch self {
                case .pokemons:
                    return "/pokemon"
                case .pokemon(let id):
                    return "/pokemon/".appending(id)
                }
            }
            
            var url: URL? {
                var urlComponents = URLComponents()
                urlComponents.scheme = "https"
                urlComponents.host = "pokeapi.co"
                urlComponents.path = "/api/v2".appending(path)
                return urlComponents.url
            }
        }
    }
}
