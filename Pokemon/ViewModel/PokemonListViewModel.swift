//
//  PokemonListViewModel.swift
//  Pokemon
//
//  Created by Raffger Sese on 5/30/20.
//  Copyright © 2020 com.oozou. All rights reserved.
//

import Foundation
import Combine

class PokemonListViewModel:BaseViewModel, ObservableObject {
    
    @Published var pokemonList:[Pokemon] = []
    @Published var showHud = true
    
    //MARK: - Private
    private var limit = 20
    private var offset = 0
    private var nextUrl: String?
    private var stopScroll: Bool = false
    
    override init() {
        super.init()
    }
    
    func getNextPokemons(completion: @escaping(Bool) ->Void) {
        
        if !self.stopScroll {
            self.showHud = true
            dataSource.getPokemonList(limit: limit, offset: offset, nextUrl: nextUrl) { pokemonListResult in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.75){  // For animation only
                    if let pokemonResult = pokemonListResult {
                        self.nextUrl = pokemonResult.next
                        self.stopScroll = pokemonResult.next == nil &&  pokemonResult.previous != nil
                        self.showHud = false
                        self.pokemonList.append(contentsOf: pokemonResult.results)
                        completion(true)
                    } else {
                        completion(false)
                    }
                }
            }
        }
    }

    func isLastPokemon(pokemon:Pokemon) -> Bool {
        if let last = self.pokemonList.last {
            if pokemon == last {
                return true
            }
        }
        return false
    }
}


