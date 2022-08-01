//
//  UINavigationBar+Extensions.swift
//  pokemonList
//
//  Created by Samuel Silva on 01/08/22.
//

import UIKit

extension UINavigationBar {
    func setDefaultBarTheme() {
        setCustomBarTheme()
    }
    
    func setCustomBarTheme(backgroundColor: UIColor? = .white, tintColor: UIColor? = .black, titleColor: UIColor? = .black) {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .black]
            navBarAppearance.backgroundColor = backgroundColor
            navBarAppearance.shadowColor = nil
            
            standardAppearance = navBarAppearance
            compactAppearance = navBarAppearance
            scrollEdgeAppearance = navBarAppearance
            
            prefersLargeTitles = false
        } else {
            barTintColor = backgroundColor
            titleTextAttributes = [.foregroundColor: tintColor ?? .black]
        }
        self.tintColor = tintColor
        isTranslucent = false
        shadowImage = UIImage()
    }
}
