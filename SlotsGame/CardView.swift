//
//  CardView.swift
//  Slots
//
//  Created by Aryan Pareek on 7/5/20.
//  Copyright © 2020 Aryan Pareek. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @Binding var symbol: String
    @Binding var background: Color
    
    var body: some View {
        Image(symbol).resizable().aspectRatio(1, contentMode: .fit).background(background.opacity(0.5)).cornerRadius(25)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("apple"), background: Binding.constant(Color(red: 33/255, green:206/255, blue: 153/255)))
    }
}

