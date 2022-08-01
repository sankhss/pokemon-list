//
//  PokemonDetailViewModel.swift
//  pokemonList
//
//  Created by Samuel Silva on 01/08/22.
//

import Foundation

class PokemonDetailViewModel: BaseViewModel {
    //MARK: - Properties
    private let pokemon: Pokemon
    public var title: String {
        "#\(pokemon.id) - \(pokemon.name.capitalized)"
    }
    public var avatar: String {
        pokemon.sprites.avatarDefault
    }
    public var height: String {
        "\(pokemon.height)"
    }
    public var weight: String {
        "\(pokemon.weight)"
    }
    public var types: String {
        pokemon.types.map { type in
            type.name.capitalized
        }.joined(separator: ", ")
    }
    public var moves: String {
        pokemon.moves.map { move in
            move.name.capitalized
        }.joined(separator: ", ")
    }
    
    //MARK: - Init
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
}
