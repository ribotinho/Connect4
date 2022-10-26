//
//  ContentView.swift
//  Connect4
//
//  Created by Pau Ribot Pujolras on 13/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color.blue.opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            
            BoardView()
  
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
