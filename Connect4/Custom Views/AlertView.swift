//
//  AlertView.swift
//  MemoryGame
//
//  Created by Pau Ribot Pujolras on 14/10/22.
//

import SwiftUI

enum AlertType {
    case win
    case outOfSpace
}

struct AlertView: View {
    
    var viewModel : GameViewModel
    var buttonWidth : CGFloat = 125
    var title : String  {
        switch viewModel.alertType {
        case .win:
            return "Congratulations! 🥳"
        case .outOfSpace:
            return "No more space!"
        case .none:
            return ""
        }
    }
    
    var description : String  {
        switch viewModel.alertType {
        case .win:
            return "Congrautalations \(viewModel.players.current.color) player.\n\nYou've won this time!"
        case .outOfSpace:
            return "You ran out of space, better luck next time!"
        case .none:
            return ""
        }
    }
    
    var body: some View {
        ZStack {
            
            Color.white
                .cornerRadius(15)
            
            VStack{
                VStack(alignment: .leading) {
                    Text(title)
                        .foregroundColor(Color(uiColor: .systemBlue))
                        .padding(.bottom)
                    
                    Text(description)
                }
                
                Spacer ()
                
                HStack{
                    
                    Button {
                        viewModel.showAlert = false
                    } label: {
                        Text("Back")
                            .frame(width: buttonWidth, height: 30)
                            .background(Color.secondary.opacity(0.25))
                            .foregroundColor(Color(UIColor.systemBlue))
                            .clipShape(Capsule())
                    }
                    
                    Button {
                        viewModel.showAlert = false
                        viewModel.clear()
                    } label: {
                        Text("Play Again")
                            .frame(width: buttonWidth, height: 30)
                            .background(.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                }
            }
            .padding()
        }
        .frame(width: 150, height: 200)
        .shadow(radius: 10)
    }
}
