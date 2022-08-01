//
//  PokemonDetailViewModel.swift
//  pokemonList
//
//  Created by Samuel Silva on 01/08/22.
//

import Foundation

class PokemonDetailViewModel {
    //MARK: - Properties
    private let pokemon: Pokemon
    private let repository = PokemonRepository()
    
    //MARK: - Init
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
}
