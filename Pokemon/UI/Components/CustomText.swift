//
//  CustomText.swift
//  Pokemon
//
//  Created by Raffger Sese on 5/30/20.
//  Copyright © 2020 com.oozou. All rights reserved.
//

import SwiftUI


struct CustomText: View {
    
    var text: String?
    var font: Font?
    var fontSize: CGFloat?
    var fontStyle: String?
    
    init() {
        self.text = ""
        self.font = Font.body
        self.fontSize = CGFloat.zero
        self.fontStyle = "Arial"
        
    }
    
    init (text: String, font: Font, fontSize: CGFloat, fontStyle: String) {
        self.text = text
        self.font = font
        self.fontSize = fontSize
        self.fontStyle = fontStyle
    }
    
    var body: some View {
        Text(self.text!).font(.custom(self.fontStyle!, size: self.fontSize!))
    }
}

struct CustomText_Previews: PreviewProvider {
    static var previews: some View {
        CustomText()
    }
}
