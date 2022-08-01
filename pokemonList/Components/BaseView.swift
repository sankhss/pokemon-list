//
//  BaseView.swift
//  pokemon-list
//
//  Created by Samuel Silva on 31/07/22.
//

import UIKit
import SnapKit

class BaseView: UIView, AppLayout {
    //MARK: - Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    required public init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    //MARK: - Setup
    func addViews() { fatalError("Must be overridden") }
    func addConstraints() { fatalError("Must be overridden") }
    func setupExtraConfigurations() {}

    private func setup() {
        addViews()
        addConstraints()
        setupExtraConfigurations()
    }
}

protocol AppLayout {}
extension AppLayout where Self: UIView {
    func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    func makeLabel(_ text: String = "", font: UIFont = .systemFont(ofSize: 14), aligment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textAlignment = aligment
        label.numberOfLines = 0
        return label
    }
}
