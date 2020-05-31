//
//  PokemonListView.swift
//  Pokemon
//
//  Created by Raffger Sese on 5/30/20.
//  Copyright © 2020 com.oozou. All rights reserved.
//

import SwiftUI

struct PokemonListView: View {
    
    @ObservedObject var pokemonListViewModel: PokemonListViewModel
    
    var body: some View {
        
        VStack {
            Section(header: CustomText(text:"Pokedex", font: Font.headline, fontSize: 26.0, fontStyle: "Arial")) {
                    self.pokemonListView
                    if (self.pokemonListViewModel.showHud) {
                        self.hudView
                    } else {
                        self.emptyView
                    }
                }
        }
        .padding(10)
        .onAppear {
            self.pokemonListViewModel.getNextPokemons() { success in
                print("Initial data received")
                
            }
        }
    }
}


// MARK: PokemonListView View variables
extension PokemonListView {
    
    var pokemonListView: some View {
        return List(pokemonListViewModel.pokemonList) { pokemon in
            HStack {
                PokemonItemView(pokemonListViewModel: PokemonListViewModel(), pokemon: pokemon)
                .onAppear {
                    self.pokemonItemOnAppear(pokemon: pokemon)
                }
            }
        }
    }
    
    var hudView : some View {
        return VStack {
            ActivityIndicator(shouldAnimate: self.$pokemonListViewModel.showHud, style: .medium)
        }
    }
    
    var emptyView : some View {
        return VStack {
            EmptyView()
        }
    }
}

//MARK: PokemonListView private functions
extension PokemonListView {
    
    private func pokemonItemOnAppear(pokemon:Pokemon) {
        if self.pokemonListViewModel.isLastPokemon(pokemon: pokemon) {
            self.pokemonListViewModel.getNextPokemons { success in
                print("Next data received")
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView(pokemonListViewModel: PokemonListViewModel())
    }
}
