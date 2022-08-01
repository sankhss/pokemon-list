//
//  PokemonCell.swift
//  pokemonList
//
//  Created by Samuel Silva on 31/07/22.
//

import UIKit

class PokemonCell: UICollectionViewCell, AppLayout {
    //MARK: - Identifier
    public static let identifier = "PokemonCell"
    
    //MARK: - Views
    private lazy var spriteImageView = makeImageView()
    private lazy var numberNameLabel = makeLabel(font: .boldSystemFont(ofSize: 14))
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [spriteImageView, numberNameLabel])
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
    func setup(with model: PokemonItemViewModel) {
        spriteImageView.imageFromURL(model.sprite)
        numberNameLabel.text = model.title
    }
}
