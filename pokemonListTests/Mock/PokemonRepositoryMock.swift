//
//  PokemonRepositoryMock.swift
//  pokemonListTests
//
//  Created by Samuel Silva on 01/08/22.
//

@testable import pokemonList
import Foundation

final class PokemonRepositoryMock: PokemonRepository {
    private let pokemons = [
        Pokemon(id: 1, name: "", order: 1, height: 1, weight: 1, types: [], moves: [], sprites: Sprites(frontDefault: "", avatarDefault: "")),
        Pokemon(id: 2, name: "", order: 1, height: 1, weight: 1, types: [], moves: [], sprites: Sprites(frontDefault: "", avatarDefault: "")),
        Pokemon(id: 3, name: "", order: 1, height: 1, weight: 1, types: [], moves: [], sprites: Sprites(frontDefault: "", avatarDefault: "")),
        Pokemon(id: 4, name: "", order: 1, height: 1, weight: 1, types: [], moves: [], sprites: Sprites(frontDefault: "", avatarDefault: "")),
        Pokemon(id: 5, name: "", order: 1, height: 1, weight: 1, types: [], moves: [], sprites: Sprites(frontDefault: "", avatarDefault: ""))
    ]
    
    func getPokemons(offset: Int, completion: @escaping ([Pokemon]?, ServiceError?) -> Void) {
        HttpClient.request(url: K.API.Endpoint.pokemons(offset: offset).url) { (result: Result<PokemonsResponse, ServiceError>) in
            switch result {
            case .success(_):
                completion(self.pokemons, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
