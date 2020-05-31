//
//  Pokemon.swift
//  Pokemon
//
//  Created by Raffger Sese on 5/30/20.
//  Copyright © 2020 com.oozou. All rights reserved.
//

import Foundation

struct PokemonListResult : Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
}

struct PokemonDetail: Codable {
    let name: String
    let height: Int
    let weight: Int
    let sprites: FrontSprites?
    
}

struct FrontSprites: Codable {
    let front_default: String
}






