//
//  ImageView.swift
//  Pokemon
//
//  Created by Raffger Sese on 5/31/20.
//  Copyright © 2020 com. All rights reserved.
//

import Combine
import SwiftUI

struct ImageView: View {
    
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    @State var showHud = true

    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }
    
    var body: some View {
        
        ZStack {
            ActivityIndicator(shouldAnimate: self.$showHud, style: .medium)
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:150, height:150)
        }.onReceive(imageLoader.didChange) { data in
            self.image = UIImage(data: data) ?? UIImage()
            self.showHud = false
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withURL: "")
    }
}
