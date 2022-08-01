//
//  PokemonDetailViewController.swift
//  pokemonList
//
//  Created by Samuel Silva on 01/08/22.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    //MARK: - Custom View
    private var customView: PokemonDetailView! { return view as? PokemonDetailView }
    
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
    
    override func loadView() {
        super.loadView()
        view = PokemonDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
}
//MARK: - Setup
extension PokemonDetailViewController {
    private func setupView() {
        customView.setup(with: viewModel)
    }
    private func setupNavigation() {
        title = viewModel.title
    }
}
