//
//  PokemonListViewController.swift
//  pokemonList
//
//  Created by Samuel Silva on 31/07/22.
//

import UIKit

class PokemonListViewController: UIViewController {
    //MARK: - Custom View
    private var customView: PokemonListView! { return view as? PokemonListView }
    
    //MARK: - Properties
    private var viewModel = PokemonListViewModel()
    
    override func loadView() {
        super.loadView()
        view = PokemonListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupObservables()
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
}
//MARK: - Setup
extension PokemonListViewController {
    private func setupDelegates() {
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
    }
    private func setupObservables() {
        viewModel.onDataUpdate = { [weak self] in
            self?.customView.collectionView.reloadData()
        }
    }
    private func loadData() {
        viewModel.loadData()
    }
    private func setupNavigation() {
        title = "Pokemons"
    }
}

extension PokemonListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK: - UICollectionView delegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.pokemons.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pokemonCell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCell.identifier, for: indexPath) as! PokemonCell
        let pokemon = viewModel.pokemons[indexPath.item]
        pokemonCell.setup(with: pokemon)
        return pokemonCell
    }
    
    //MARK: - Collection flow layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.bounds.width, height: 140)
    }
}

