//
//  PokemonItemView.swift
//  Pokemon
//
//  Created by Raffger Sese on 5/30/20.
//  Copyright © 2020 com.oozou. All rights reserved.
//

import SwiftUI

struct PokemonItemView: View {
    
    @ObservedObject var pokemonListViewModel: PokemonListViewModel
    @State private var showModal = false
    
    var pokemon: Pokemon
    
       var body: some View {
           HStack {
               Text(pokemon.name)
           }.onTapGesture {
                print("Clicked: ",self.pokemon.name)
                self.showModal = true
            
           }.sheet(isPresented: $showModal) {
                ZStack {
                    self.closeIcon
                    PokemonDetailView(pokemonDetailViewModel: PokemonDetailViewModel(url: self.pokemon.url))
                }
           }
       }
    
}

extension PokemonItemView {
    
    var closeIcon: some View {
        return ZStack {
            Image(systemName: "circle.fill")
                .foregroundColor(Color.gray)
                .font(.system(size: 31))
            Image(systemName: "xmark")
                .foregroundColor(Color.secondary)
                .font(.system(size: 15, weight: .bold))
        }
        .offset(x: (UIScreen.main.bounds.size.width / 2) - 30, y: ((UIScreen.main.bounds.size.height / 2) * -1) + 80)
        .onTapGesture {
            self.showModal = false
        }
    }
}

struct PokemonItemView_Previews: PreviewProvider {
        static var previews: some View {
            PokemonItemView(pokemonListViewModel: PokemonListViewModel(), pokemon: Pokemon(name: "Balbasaur", url: ""))
       }
}




