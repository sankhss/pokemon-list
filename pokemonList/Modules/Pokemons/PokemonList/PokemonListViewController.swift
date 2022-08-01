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
    private let viewModel: PokemonListViewModel
    weak var coordinator: PokemonListNavigationDelegate?
    
    //MARK: - Init
    init(viewModel: PokemonListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: LoadingFooterView.identifier, for: indexPath)
        }
        return UICollectionReusableView()
    }
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionView.elementKindSectionFooter {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.loadData()
            }
        }
    }

    
    //MARK: - Collection flow layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.bounds.width, height: 140)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        .init(width: collectionView.bounds.width, height: 100)
    }
}

