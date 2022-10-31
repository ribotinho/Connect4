//
//  BoardView.swift
//  Connect4
//
//  Created by Pau Ribot Pujolras on 27/10/22.
//

import SwiftUI

struct BoardView : View {
    @ObservedObject var viewModel : GameViewModel
    @State var isChipHidden : Bool = true
    @State var xOffset : CGFloat = 0
    @State var yOffset : CGFloat = -175
    
    var body: some View {
        ZStack (alignment: .leading){
            
            ChipView(color: viewModel.players.current.color == .red ? Color.red : Color.yellow)
                .zIndex(0)
                .offset(x: xOffset, y: yOffset)
                .opacity(isChipHidden ? 0 : 1)
            
            Grid(horizontalSpacing:0, verticalSpacing: 0, content: {
                ForEach(0..<viewModel.board.count, id:\.self ){ row in
                    GridRow {
                        ForEach(0..<viewModel.board[row].count, id: \.self) { column in
                            TileView(tile: viewModel.board[row][column])
                                .allowsHitTesting(isChipHidden)
                                .onTapGesture {
                                    if viewModel.isColumnFull(column: column) {
                                        animateChipDrop(column: column)
                                        viewModel.movements += 1
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            viewModel.updateBoard(column: column)
                                            isChipHidden = true
                                            resetOffset()
                                        }
                                    }
                                }
                        }
                    }
                }
            })
        }
        .zIndex(1)
    }
    
    
    private func resetOffset() {
        xOffset = 0
        yOffset = -175
    }
    
    private func animateChipDrop(column: Int) {
        xOffset = CGFloat(column) * (UI.screenWidth / 8)
        isChipHidden = false
        
        withAnimation(.easeIn(duration: 1)) {
            yOffset = viewModel.calculateYOffset(column: column)
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(viewModel: GameViewModel())
    }
}
