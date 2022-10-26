//
//  Game.swift
//  Connect4
//
//  Created by Pau Ribot Pujolras on 26/10/22.
//

import Foundation

final class Game : ObservableObject{
    
    @Published var board : [[Tile]] = []
    @Published var currentPlayer : Player = Player(color: .red)
    @Published var isGameOver = false
    @Published var isBoardFull = false
    
    init() {
        for _ in 0..<UIBoard.rows {
            board.append(Array(repeating: Tile(player: nil), count: UIBoard.columns))
        }
    }
    
    func updateBoard(column: Int){
        updateState(column: column)
        
        if checkWinCondition(column: column) {
            isGameOver = true
        }else {
            if !checkBoardFull() {
                nextTurn()
            }else{
                isBoardFull = true
            }
        }
    }
    
    private func checkWinCondition(column: Int) -> Bool{
        return checkHorizontalWin(column: column) || checkVerticalWin(column: column) || checkDiagonalWin(column: column)
    }
    
    private func checkHorizontalWin(column: Int) -> Bool {
        var streak = 0
        
        for row in (0..<board.count).reversed() {
            for horizontal in (0..<board[row].count) {
                if board[row][horizontal].player == currentPlayer {
                    streak += 1
                    if streak == 4 { return true }
                }else{
                    streak = 0
                }
            }
        }
        
        return false
    }
    
    private func checkVerticalWin(column: Int) -> Bool {
        var streak = 0
        
        for row in (0..<board.count).reversed() {
            if board[row][column].player == currentPlayer {
                streak += 1
                if streak == 4 { return true }
            }else{
                streak = 0
            }
        }
        return false
    }
    
    private func checkDiagonalWin(column: Int) -> Bool {
        return false
    }
    
    private func updateState(column: Int){
        for row in (0..<board.count).reversed() {
            guard let _ = board[row][column].player else {
                board[row][column].player = currentPlayer
                break
            }
        }
    }
    
    private func nextTurn(){
        if currentPlayer.color == .red {
            currentPlayer.color = .yellow
        }else {
            currentPlayer.color = .red
        }
    }
    
    private func checkBoardFull() -> Bool {
        
        for row in 0..<board.count {
            if (board[row].filter({$0.player != nil}).count > 0 ) {
                return false
            }
        }
        return true
    }
    
    func calculateYOffset(column: Int) -> CGFloat{
        var offset : CGFloat = 125
        
        for row in (0..<board.count).reversed() {
            if let _ = board[row][column].player  {
                offset -= 50
            }else{
                break
            }
        }
        return offset
    }
    
    func isColumnFull(column: Int) -> Bool {
        return board[0][column].player == nil
    }
}
