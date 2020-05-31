//
//  PokemonDetailView.swift
//  Pokemon
//
//  Created by Raffger Sese on 5/30/20.
//  Copyright © 2020 com.oozou. All rights reserved.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @ObservedObject var pokemonDetailViewModel: PokemonDetailViewModel
    
    var body: some View {
        VStack {
            if (self.pokemonDetailViewModel.showHud) {
                self.hudView
            } else {
                self.pokemonActualView
            }
        }
    }
}

//MARK: Private Variables
extension PokemonDetailView {
    
    var hudView : some View {
        return VStack {
            ActivityIndicator(shouldAnimate: self.$pokemonDetailViewModel.showHud, style: .large)
        }
    }
    
    var pokemonActualView: some View {
        
        return VStack {
            ImageView(withURL: self.pokemonDetailViewModel.pokemon.sprites!.front_default)
            CustomText(text: self.pokemonDetailViewModel.pokemon.name, font: Font.headline, fontSize: 24.0, fontStyle: "Arial")
            CustomText(text: self.formatWeight(withValue: self.pokemonDetailViewModel.pokemon.weight), font: Font.body, fontSize: 16.0, fontStyle: "Arial")
                .padding(.top, 10.0)
                .padding(.bottom, 5.0)
            CustomText(text: self.formatHeight(withValue: self.pokemonDetailViewModel.pokemon.height), font: Font.body, fontSize: 16.0, fontStyle: "Arial")
        }
    }
    
}

//MARK: Private functions
extension PokemonDetailView {

    private func formatWeight(withValue weight: Int) -> String {
        return "\((weight * 100).withCommas()) grams"
    }
    
    private func formatHeight(withValue height: Int) -> String {
        return "\(CGFloat(height) / 10 ) meters"
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemonDetailViewModel: PokemonDetailViewModel(url: ""))
    }
}

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
