//
//  ContentView.swift
//  Pokemon
//
//  Created by Raffger Sese on 5/30/20.
//  Copyright © 2020 com. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PokemonListView(pokemonListViewModel: PokemonListViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
