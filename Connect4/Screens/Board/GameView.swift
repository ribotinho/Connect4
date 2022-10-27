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
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.bottom)
                    
                    BoardView(viewModel: viewModel)
                        .padding(.bottom)
                        
                    ResultView(viewModel: viewModel)
                    
                    Spacer()
                    
                    HStack(spacing: 25){
                        ZStack{
                            Color.white
                                .frame(width: 80, height: 80)
                                .cornerRadius(10)
                            
                            VStack{
                                Image(systemName: "arrow.uturn.forward")
                                    .font(.title)
                                Text("Restart")
                            }
                        }
                        
                        ZStack{
                            Color.white
                                .frame(width: 80, height: 80)
                                .cornerRadius(10)
                            
                            VStack{
                                Image(systemName: "xmark.bin")
                                    .font(.title)
                                Text("Clear")
                            }
                        }
                    }
                    .padding(.bottom)
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


