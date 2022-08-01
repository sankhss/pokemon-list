//
//  PokemonRepository.swift
//  pokemonList
//
//  Created by Samuel Silva on 31/07/22.
//

import Foundation
import Combine

final class PokemonRepository {
    // MARK: - Properties
    private var decoder = JSONDecoder()

    // MARK: PokemonRepository
    func getPokemons(completion: @escaping ([Pokemon]?, ServiceError?) -> Void) {
        getPokemonList { baseList, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let baseList = baseList else {
                completion([], nil)
                return
            }
            
            let group = DispatchGroup()
            var pokemonDetails: [Pokemon] = []
            
            for base in baseList {
                group.enter()
                self.getPokemonDetail(detailUrl: base.url) { pokemonDetail, error in
                    if let pokemon = pokemonDetail {
                        pokemonDetails.append(pokemon)
                    }
                    group.leave()
                }
            }
            
            group.notify(queue: .main) {
                pokemonDetails.sort { $0.id < $1.id }
                completion(pokemonDetails, nil)
            }
        }
    }
    
    private func getPokemonList(completion: @escaping ([PokemonBase]?, ServiceError?) -> Void) {
        HttpClient.request(url: K.API.Endpoint.pokemons.url) { (result: Result<PokemonsResponse, ServiceError>) in
            switch result {
            case .success(let data):
                completion(data.results, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    private func getPokemonDetail(detailUrl: String, completion: @escaping (Pokemon?, ServiceError?) -> Void) {
        HttpClient.request(url: URL(string: detailUrl)) { (result: Result<Pokemon, ServiceError>) in
            switch result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

