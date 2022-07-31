//
//  BaseView.swift
//  pokemon-list
//
//  Created by Samuel Silva on 31/07/22.
//

import UIKit
import SnapKit

class BaseView: UIView {
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
