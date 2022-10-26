//
//  BoardView.swift
//  Connect4
//
//  Created by Pau Ribot Pujolras on 26/10/22.
//

import SwiftUI

struct BoardView: View {
    
    @State var xOffset : CGFloat = 0
    @State var yOffset : CGFloat = -175
    @State var isChipHidden : Bool = true
    @ObservedObject var game = Game()
    
    var body: some View {
        
        ZStack (alignment: .leading){
            
            if (game.isBoardFull) {
                Text("full")
            }else if (game.isGameOver) {
                Text("has won the game")
            }else {
                
                ChipView(color: game.currentPlayer.color == .red ? Color.red : Color.yellow)
                    .zIndex(0)
                    .offset(x: xOffset, y: yOffset)
                    .opacity(isChipHidden ? 0 : 1)
                
                Grid(horizontalSpacing:0, verticalSpacing: 0, content: {
                    ForEach(0..<game.board.count, id:\.self ){ row in
                        GridRow {
                            ForEach(0..<game.board[row].count, id: \.self) { column in
                                TileView(tile: game.board[row][column])
                                    .allowsHitTesting(isChipHidden)
                                    .onTapGesture {
                                        if game.isColumnFull(column: column) {
                                            animateChipDrop(column: column)
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                game.updateBoard(column: column)
                                                isChipHidden = true
                                                resetOffset()
                                            }
                                        }
                                    }
                            }
                        }
                    }
                })
                .zIndex(1)
            }
        }
    }
    
    private func resetOffset() {
        xOffset = 0
        yOffset = -175
    }
    
    private func animateChipDrop(column: Int) {
        xOffset = CGFloat(column) * (UI.screenWidth / 8)
        isChipHidden = false
        
        withAnimation(.easeIn(duration: 1)) {
            yOffset = game.calculateYOffset(column: column)
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
