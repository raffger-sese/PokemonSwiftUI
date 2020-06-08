//
//  PokemonDetailViewModel.swift
//  Pokemon
//
//  Created by Raffger Sese on 5/30/20.
//  Copyright © 2020 com. All rights reserved.
//

import Foundation
import Combine


class PokemonDetailViewModel:BaseViewModel, ObservableObject {

    @Published var pokemon:PokemonDetail = PokemonDetail(name: "", height: 0, weight: 0, sprites: FrontSprites(front_default: ""))
    @Published var showHud = true
    
    //MARK: - Private
    private var detailUrl = ""
    
    init(url: String) {
        super.init()
        detailUrl = url
        self.getPokemonDetail() { success in
            print("Get Detail")
        }
    }
    
    func getPokemonDetail(completion: @escaping(Bool) ->Void) {
     dataSource.getPokemonDetail(url: detailUrl) { pokemonDetail in
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75){  // For animation only
             if let pokemon = pokemonDetail {
                     self.showHud = false
                     self.pokemon = pokemon
                     completion(true)
                }
                else {
                    self.showHud = false
                    completion(false)
                }
            }
        }
    }
}
