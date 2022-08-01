//
//  PokemonDetailView.swift
//  pokemonList
//
//  Created by Samuel Silva on 01/08/22.
//

import UIKit

class PokemonDetailView: BaseView {
    //MARK: - Views
    //MARK: Title
    private lazy var avatarImageView = makeImageView()
    
    //MARK: Details
    private lazy var heightLabel = makeLabel()
    private lazy var weightLabel = makeLabel()
    private lazy var typesLabel = makeLabel()
    private lazy var movesLabel = makeLabel()
    private lazy var detailsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [heightLabel, weightLabel, typesLabel, movesLabel])
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [avatarImageView, detailsStackView])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 24
        return stack
    }()
    
    //MARK: - Setup
    override func addViews() {
        addSubview(contentStackView)
    }
    override func addConstraints() {
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(24)
        }
        avatarImageView.snp.makeConstraints { make in
            make.height.width.lessThanOrEqualTo(200)
        }
    }
    override func setupExtraConfigurations() {
        backgroundColor = .white
    }
}
//MARK: - Support
extension PokemonDetailView {
    func setup(with model: PokemonDetailViewModel) {
        avatarImageView.imageFromURL(model.avatar)
        heightLabel.text = "Height: \(model.height)"
        weightLabel.text = "Weight: \(model.weight)"
        typesLabel.text = "Types: \(model.types)"
        movesLabel.text = "Moves: \(model.moves)"
    }
}
