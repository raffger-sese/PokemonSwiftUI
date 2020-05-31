//
//  ActivityIndicator.swift
//  Pokemon
//
//  Created by Raffger Sese on 5/31/20.
//  Copyright © 2020 com.oozou. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    @Binding var shouldAnimate: Bool
    var style: UIActivityIndicatorView.Style
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: style)
        return indicator
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if self.shouldAnimate {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}
