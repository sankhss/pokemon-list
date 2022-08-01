//
//  PokemonListViewModel.swift
//  pokemonList
//
//  Created by Samuel Silva on 31/07/22.
//

import Foundation

class PokemonListViewModel: BaseViewModel {
    //MARK: - Properties
    private let repository = PokemonRepository()
    
    //MARK: - State properties
    private var pokemons = [Pokemon]()
    
    var count: Int {
        pokemons.count
    }
    
    func loadData() {
        repository.getPokemons(offset: pokemons.last?.id ?? 0) { pokemons, error in
            if let error = error {
                self.onError?(error.localizedDescription)
            }
            
            if let pokemons = pokemons {
                self.pokemons.append(contentsOf: pokemons)
                self.onDataUpdate?()
            }
        }
    }
    
    func getPokemon(at index: Int) -> PokemonItemViewModel {
        PokemonItemViewModel(pokemon: pokemons[index])
    }
    
    func selectPokemon(at index: Int) -> PokemonDetailViewModel {
        PokemonDetailViewModel(pokemon: pokemons[index])
    }
}
