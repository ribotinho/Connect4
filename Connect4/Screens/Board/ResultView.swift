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
        
        ZStack {
            
            Color.white
                .cornerRadius(10)
                .frame(height: 50)
                .padding(.horizontal, 20)
            
            HStack{
                HStack (spacing: 5) {
                    
                    Image("red_tile")
                        .resizable()
                        .frame(width:25, height: 25)
                    Text("Player 1")
                }
                Spacer()
                
                Text("0 - 0")
                
                Spacer()
                
                HStack (spacing: 5) {
                    
                    Image("yellow_tile")
                        .resizable()
                        .frame(width:25, height: 25)
                    Text("Player 2")
                }
            }
            .padding(.horizontal, 25)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(viewModel: GameViewModel())
    }
}
