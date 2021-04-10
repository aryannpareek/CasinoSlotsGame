//
//  ContentView.swift
//  Slots
//
//  Created by Aryan Pareek on 7/3/20.
//  Copyright © 2020 Aryan Pareek. All rights reserved.
//

import SwiftUI
//import SceneKit
//import SpriteKit
//import AVFoundation
struct ContentView: View {
    @State private var symbols: [String] = ["apple", "donut", "cherry"]
    @State private var num: [Int] = Array(repeating: 0, count: 9)
    @State private var balance: Int = 1000
    @State private var backgrounds: [Color] = Array(repeating: Color.gray, count: 9)
    private var teal: Color = Color(red: 33/255, green:206/255, blue: 153/255)
    private var gold: Color = Color(red: 255/255, green: 215/255, blue: 0/255)
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(teal).edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(Color.white).rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all)
            
                VStack {
                    Spacer()
                    
                    HStack {
                        Text("Casino Slots")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                        //Image(systemName: "waveform.path.ecg")
                    }.scaleEffect(2)
                    
                    Spacer()
                    
                    Text("Balance: $" + String(self.balance)).foregroundColor(Color.black).padding(.all,10.0).background(gold).cornerRadius(20)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Spacer()
                            CardView(symbol: $symbols[num[0]], background: $backgrounds[0])
                            CardView(symbol: $symbols[num[1]], background: $backgrounds[1])
                            CardView(symbol: $symbols[num[2]], background: $backgrounds[2])
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            CardView(symbol: $symbols[num[3]], background: $backgrounds[3])
                            CardView(symbol: $symbols[num[4]], background: $backgrounds[4])
                            CardView(symbol: $symbols[num[5]], background: $backgrounds[5])
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            CardView(symbol: $symbols[num[6]], background: $backgrounds[6])
                            CardView(symbol: $symbols[num[7]], background: $backgrounds[7])
                            CardView(symbol: $symbols[num[8]], background: $backgrounds[8])
                            Spacer()
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        self.balance -= 15
                        //Reset backgrounds to gray
                        self.backgrounds = self.backgrounds.map {
                            _ in Color.gray
                        }
                        //Randomize slots for middle row
                        for counter in 3...5 {
                            self.num[counter] = Int.random(in: 0...self.symbols.count - 1)
                        }
                        //Check middle row match
                        self.checkMatch(3, 4, 5)
                        /*Check BK
                        if self.balance <= 0 {
                            
                            Bankrupt()
                        }*/
                    }) {
                        Text("$15 Middle Row Spin").foregroundColor(Color.black).padding(.all,10.0).background(Color.pink).cornerRadius(20)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        self.balance -= 85
                        //Reset backgrounds to gray
                        self.backgrounds = self.backgrounds.map {
                            _ in Color.gray
                        }
                        //Randomize all slots
                        for counter in 0...self.num.count - 1 {
                            self.num[counter] = Int.random(in: 0...self.symbols.count - 1)
                        }
                        //Check horizontal matches
                        self.checkMatch(0, 1, 2)
                        self.checkMatch(3, 4, 5)
                        self.checkMatch(6, 7, 8)
                        //Check diagonal matches
                        self.checkMatch(0, 4, 8)
                        self.checkMatch(2, 4, 6)
                        //Check downward matches
                        self.checkMatch(0, 3, 6)
                        self.checkMatch(1, 4, 7)
                        self.checkMatch(2, 5, 8)
                        //Check all matches
                        var numMatches: Int = 0
                        for counter in 0...self.num.count - 2 {
                            if self.num[counter] == self.num[counter + 1] {
                                numMatches += 1
                            }
                        }
                        if numMatches == 8 {
                            self.balance += 25000
                            self.backgrounds = Array(repeating: self.gold, count: 9)
                        }
                        /*Check BK
                        if self.balance <= 0 {
                            Bankrupt()
                        }*/
                    }) {
                        Text("$85 Full Board Spin").foregroundColor(Color.black).padding(.all,10.0).background(Color.pink).cornerRadius(20)
                    }
            }
        }
    }
    
    func checkMatch(_ ind1: Int, _ ind2: Int, _ ind3: Int) {
        if self.num[ind1] == self.num[ind2] && self.num[ind2] == self.num[ind3]
        {
            self.balance += 100
            backgrounds[ind1] = teal
            backgrounds[ind2] = teal
            backgrounds[ind3] = teal
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

