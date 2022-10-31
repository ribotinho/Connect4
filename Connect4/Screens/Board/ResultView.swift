//
//  ResultView.swift
//  Connect4
//
//  Created by Pau Ribot Pujolras on 27/10/22.
//

import SwiftUI

struct ResultView: View {
    
    @ObservedObject var viewModel : GameViewModel
    private let imageSize : CGFloat = 50
    @State private var turnBarOffset : Double = -130
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .cornerRadius(10)
                .frame(height: 75)
                .padding(.horizontal, 20)
            
            VStack(spacing: 5){
                HStack(alignment: .center){
                    Image("red_tile")
                        .resizable()
                        .frame(width:imageSize, height: imageSize)
                        .frame(maxWidth: .infinity)
                    
                    Text("0 : 0")
                        .bold()
                        .font(.system(size: 40))
                        .frame(maxWidth: .infinity)
                    
                    Image("yellow_tile")
                        .resizable()
                        .frame(width:imageSize, height: imageSize)
                        .frame(maxWidth: .infinity)
                }
                
                Color.blue
                    .frame(width:75, height:5)
                    .cornerRadius(32)
                    .offset(x: turnBarOffset)
            }
            .onChange(of: viewModel.currentPlayer.color) { value in
                switch value {
                case .red:
                    withAnimation() { turnBarOffset = -130 }
                case .yellow:
                    withAnimation() { turnBarOffset = 135 }
                }
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(viewModel: GameViewModel())
    }
}
