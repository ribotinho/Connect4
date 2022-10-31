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
            
            if (viewModel.showAlert) {
                AlertView(viewModel: viewModel)
                    .zIndex(2)
            }
            
            VStack {
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.bottom)
                
                BoardView(viewModel: viewModel)
                    .cornerRadius(10)
                    .padding(.bottom)
                
                
                ResultView(viewModel: viewModel)
                
                Spacer()
                
                ButtonView(viewModel: viewModel)
            }
        }
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}



