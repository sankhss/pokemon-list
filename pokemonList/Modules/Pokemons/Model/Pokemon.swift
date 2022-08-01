//
//  Pokemon.swift
//  pokemonList
//
//  Created by Samuel Silva on 31/07/22.
//

import Foundation

struct PokemonsResponse: Decodable {
    var results: [PokemonBase]
}

struct PokemonBase: Decodable {
    var name: String
    var url: String
}

struct Pokemon: Decodable {
    var id: Int
    var name: String
    var order: Int
    var height: Int
    var weight: Int
    var types: [PokemonType]
    var moves: [Move]
    var sprites: Sprites
}

struct PokemonType: Decodable {
    var name: String
    
    enum ContainerKeys: String, CodingKey {
        case type
    }
    
    enum OtherKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let moveContainer = try decoder.container(keyedBy: ContainerKeys.self)
        let otherContainer = try moveContainer.nestedContainer(keyedBy: OtherKeys.self, forKey: .type)
        
        self.name = try otherContainer.decode(String.self, forKey: .name)
    }
}

struct Move: Decodable {
    var name: String
    
    enum ContainerKeys: String, CodingKey {
        case move
    }
    
    enum OtherKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let moveContainer = try decoder.container(keyedBy: ContainerKeys.self)
        let otherContainer = try moveContainer.nestedContainer(keyedBy: OtherKeys.self, forKey: .move)
        
        self.name = try otherContainer.decode(String.self, forKey: .name)
    }
}

struct Sprites: Decodable {
    var frontDefault: String
    var avatarDefault: String

    enum ContainerKeys: String, CodingKey {
        case frontDefault = "front_default"
        case other
    }
    
    enum OtherKeys: String, CodingKey {
        case home
    }
    
    enum HomeKeys: String, CodingKey {
        case avatarDefault = "front_default"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ContainerKeys.self)
        let otherContainer = try container.nestedContainer(keyedBy: OtherKeys.self, forKey: .other)
        let homeContainer = try otherContainer.nestedContainer(keyedBy: HomeKeys.self, forKey: .home)
        
        self.frontDefault = try container.decode(String.self, forKey: .frontDefault)
        self.avatarDefault = try homeContainer.decode(String.self, forKey: .avatarDefault)
    }
}
