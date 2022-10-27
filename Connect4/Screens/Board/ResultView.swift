//
//  ResultView.swift
//  Connect4
//
//  Created by Pau Ribot Pujolras on 27/10/22.
//

import SwiftUI

struct ResultView: View {
    
    @ObservedObject var viewModel : GameViewModel
    
    var body: some View {
        HStack{
            VStack (spacing: 5) {
                
                Image("red_tile")
                    .resizable()
                    .frame(width:50, height: 50)
                Text("Player 1")
            }
            
            Text("0 - 0")

            VStack (spacing: 5) {
                
                Image("yellow_tile")
                    .resizable()
                    .frame(width:50, height: 50)
                Text("Player 2")
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(viewModel: GameViewModel())
    }
}
