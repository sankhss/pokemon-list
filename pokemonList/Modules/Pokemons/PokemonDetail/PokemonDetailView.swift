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
        stack.alignment = .top
        stack.spacing = 8
        return stack
    }()
    
    //MARK: - Setup
    override func addViews() {
        addSubview(avatarImageView)
        addSubview(detailsStackView)
    }
    override func addConstraints() {
        avatarImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(24)
            make.height.lessThanOrEqualTo(200)
        }
        detailsStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(avatarImageView)
            make.top.equalTo(avatarImageView.snp.bottom).offset(24)
            make.bottom.greaterThanOrEqualToSuperview().inset(24).priority(.low)
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
