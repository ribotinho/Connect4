//
//  ButtonView.swift
//  Connect4
//
//  Created by Pau Ribot Pujolras on 31/10/22.
//

import SwiftUI

struct ButtonView: View {
    
    @ObservedObject var viewModel : GameViewModel
    
    var body: some View {
        HStack(spacing: 25){
            ZStack{
                Color.white
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
                
                VStack(spacing: 12){
                    Image(systemName: "arrow.uturn.forward")
                        .font(.title)
                    
                    Text("Restart")
                }
                .onTapGesture {
                    viewModel.restart()
                }
            }
            
            ZStack{
                Color.white
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
                
                VStack(spacing: 12){
                    Image(systemName: "xmark.bin")
                        .font(.title)
                    Text("Clear")
                }
                .onTapGesture {
                    viewModel.clear()
                }
            }
        }
        .padding(.bottom)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(viewModel: GameViewModel())
    }
}
