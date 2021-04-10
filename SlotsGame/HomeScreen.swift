//
//  HomeScreen.swift
//  SlotsGame
//
//  Created by Aryan Pareek on 7/9/20.
//  Copyright © 2020 Aryan Pareek. All rights reserved.
//

import SwiftUI
import SpriteKit

struct HomeScreen: View {
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color(red: 33/255, green:206/255, blue: 153/255)).edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(Color.white).rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer().frame(height: 150)
                HStack {
                    Text("Homescreen")
                        .fontWeight(.semibold)
                    Image(systemName: "waveform.path.ecg")
                }.scaleEffect(2)
                //Image("guh")
                Spacer().frame(height: 150)
                Button(action: {
                    //ContentView()
                    
                }) {
                    Text("Play Slots!").foregroundColor(Color.black).padding(.all,10.0).background(Color.pink).cornerRadius(20)
                }
                Spacer().frame(height: -25)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
