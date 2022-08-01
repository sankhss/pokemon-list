//
//  LoadingFooterView.swift
//  pokemonList
//
//  Created by Samuel Silva on 01/08/22.
//

import UIKit

class LoadingFooterView: UICollectionReusableView {
    //MARK: - Identifier
    public static let identifier = "LoadingFooterView"
    
    //MARK: - Views
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .medium
        return indicator
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
    
    private func addViews() {
        addSubview(activityIndicator)
    }
    
    private func addConstraints() {
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(50)
        }
    }
    
    private func setupExtraConfigurations() {
        activityIndicator.startAnimating()
    }
    
}
