//
//  BaseViewModel.swift
//  pokemonList
//
//  Created by Samuel Silva on 01/08/22.
//

import Foundation

class BaseViewModel {
    //MARK: - State events
    var onDataUpdate: (() -> Void)?
    var onError: ((String) -> Void)?
    var isLoading: ((Bool) -> Void)?
}
