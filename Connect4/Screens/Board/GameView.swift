//
//  BoardView.swift
//  Connect4
//
//  Created by Pau Ribot Pujolras on 26/10/22.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        
        ZStack{
            
            if (viewModel.isBoardFull) {
                
                Text("full")
            }else if (viewModel.isGameOver) {
                
                Text("has won the game")
            }else {
                
                VStack {
                    BoardView(viewModel: viewModel)
                        .padding(.bottom)
                    ResultView(viewModel: viewModel)
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}


