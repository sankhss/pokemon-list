//
//  PokemonsCoordinator.swift
//  pokemonList
//
//  Created by Samuel Silva on 01/08/22.
//

import UIKit

final class PokemonsCoordinator: Coordinator {
    // MARK: - Properties

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    // MARK: - Initializers

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Flow

    func start() {
        let pokemonListViewController = PokemonListViewController(viewModel: PokemonListViewModel())
        pokemonListViewController.coordinator = self
        navigationController.viewControllers = [pokemonListViewController]
    }
}

extension PokemonsCoordinator: PokemonListNavigationDelegate {
    func didSelectPokemon(_ viewModel: PokemonDetailViewModel) {
        let pokemonDetailViewController = PokemonDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(pokemonDetailViewController, animated: true)
    }
}
