//
//  Bankrupt.swift
//  SlotsGame
//
//  Created by Aryan Pareek on 7/8/20.
//  Copyright © 2020 Aryan Pareek. All rights reserved.
//

import SwiftUI

struct Bankrupt: View {
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color(red: 33/255, green:206/255, blue: 153/255)).edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(Color.white).rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer().frame(height: 150)
                Text("Bankrupt!")
                    .fontWeight(.semibold).scaleEffect(2)
                Image("guh")
                Spacer().frame(height: 150)
                Button(action: {
                    ContentView()
                }) {
                    Text("Play Again").foregroundColor(Color.black).padding(.all,10.0).background(Color.pink).cornerRadius(20)
                }
                Spacer().frame(height: -25)
            }
        }
    }
}

struct Bankrupt_Previews: PreviewProvider {
    static var previews: some View {
        Bankrupt()
    }
}
