//
//  ContentView.swift
//  Connect4
//
//  Created by Pau Ribot Pujolras on 13/10/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            
            Color.blue.opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            
            GameView()
  
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
