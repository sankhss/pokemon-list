//
//  PokemonDetailViewController.swift
//  pokemonList
//
//  Created by Samuel Silva on 01/08/22.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    //MARK: - Properties
    private let viewModel: PokemonDetailViewModel
    
    //MARK: - Init
    init(viewModel: PokemonDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
