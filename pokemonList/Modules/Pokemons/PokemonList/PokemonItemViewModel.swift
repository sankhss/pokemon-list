//
//  PokemonItemViewModel.swift
//  pokemonList
//
//  Created by Samuel Silva on 01/08/22.
//

import Foundation

class PokemonItemViewModel {
    //MARK: - Properties
    private let pokemon: Pokemon
    
    public var title: String {
        "#\(pokemon.id) - \(pokemon.name.capitalized)"
    }
    public var sprite: String {
        pokemon.sprites.frontDefault
    }
    
    //MARK: - Init
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
}
