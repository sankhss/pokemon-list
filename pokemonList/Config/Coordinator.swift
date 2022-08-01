//
//  Coordinator.swift
//  pokemonList
//
//  Created by Samuel Silva on 01/08/22.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
