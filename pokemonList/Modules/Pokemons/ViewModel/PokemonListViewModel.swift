//
//  PokemonListViewModel.swift
//  pokemonList
//
//  Created by Samuel Silva on 31/07/22.
//

import Foundation

class PokemonListViewModel {
    //MARK: - Properties
    private let repository = PokemonRepository()
    
    //MARK: - State properties
    var pokemons = [Pokemon]()
    
    //MARK: - State events
    var onDataUpdate: (() -> Void)?
    var onError: ((String) -> Void)?
    
    func loadData() {
        repository.getPokemons { pokemons, error in
            if let error = error {
                self.onError?(error.localizedDescription)
            }
            
            if let pokemons = pokemons {
                self.pokemons = pokemons
                self.onDataUpdate?()
            }
        }
    }
}
