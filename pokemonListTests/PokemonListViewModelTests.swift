//
//  pokemonListTests.swift
//  pokemonListTests
//
//  Created by Samuel Silva on 31/07/22.
//

@testable import pokemonList
import XCTest

class pokemonListTests: XCTestCase {
    
    var viewModel: PokemonListViewModel!

    override func setUp() {
        super.setUp()
        viewModel = PokemonListViewModel(repository: PokemonRepositoryImpl())
    }

    func test_pokemonListViewModel_loadsDataCorrectly() throws {
        
    }

}
