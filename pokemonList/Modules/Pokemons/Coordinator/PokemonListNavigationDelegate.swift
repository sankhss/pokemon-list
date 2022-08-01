//
//  PokemonListNavigationDelegate.swift
//  pokemonList
//
//  Created by Samuel Silva on 01/08/22.
//

import UIKit

protocol PokemonListNavigationDelegate: AnyObject {
    func didSelectPokemon(_ viewModel: PokemonDetailViewModel)
}
