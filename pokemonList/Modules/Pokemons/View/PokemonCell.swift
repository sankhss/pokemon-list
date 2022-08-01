//
//  PokemonCell.swift
//  pokemonList
//
//  Created by Samuel Silva on 31/07/22.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    //MARK: - Identifier
    public static let identifier = "PokemonCell"
    
    //MARK: - Views
    private lazy var spriteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [spriteImageView, numberLabel, nameLabel])
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 24
        return stack
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
        setupExtraConfigurations()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    private func addViews() {
        contentView.addSubview(contentStackView)
    }
    private func addConstraints() {
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    private func setupExtraConfigurations() {
        backgroundColor = .white
    }
}
//MARK: - Support
extension PokemonCell {
    func setup(with pokemon: Pokemon) {
        numberLabel.text = "#\(pokemon.id)"
        spriteImageView.imageFromURL(pokemon.sprites.frontDefault)
        nameLabel.text = pokemon.name
        
        layoutIfNeeded()
    }
}
