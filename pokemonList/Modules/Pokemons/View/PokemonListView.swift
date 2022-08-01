//
//  PokemonListView.swift
//  pokemonList
//
//  Created by Samuel Silva on 31/07/22.
//

import UIKit

class PokemonListView: BaseView {
    private(set) lazy var collectionView: UICollectionView = {
        let layout =  UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(PokemonCell.self, forCellWithReuseIdentifier: PokemonCell.identifier)
        collection.register(LoadingFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: LoadingFooterView.identifier)
        return collection
    }()
    
    override func addViews() {
        addSubview(collectionView)
    }
    
    override func addConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
