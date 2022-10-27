//
//  Game.swift
//  Connect4
//
//  Created by Pau Ribot Pujolras on 26/10/22.
//

import Foundation

final class GameViewModel : ObservableObject{
    
    @Published var board : [[Tile]] = []
    @Published var currentPlayer : Player = Player(color: .red)
    @Published var isGameOver = false
    @Published var isBoardFull = false
    @Published var movements = 0
    
    init() {
        for _ in 0..<UIBoard.rows {
            board.append(Array(repeating: Tile(player: nil), count: UIBoard.columns))
        }
    }
    
    func updateBoard(column: Int){
        if let row = getRowToUpdate(column: column) {
            board[row][column].player = currentPlayer
            
            if checkWinCondition(column: column, row: row) {
                isGameOver = true
            }else {
                if !checkBoardFull() {
                    nextTurn()
                }else{
                    isBoardFull = true
                }
            }
        }
    }
    
    private func checkWinCondition(column: Int, row: Int) -> Bool{
        return checkHorizontalWin(column: column) || checkVerticalWin(column: column) || checkDiagonalWin(column: column, row: row)
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
    
    private func checkDiagonalWin(column: Int, row: Int) -> Bool {
        
        var streak = 0

        if(column + 4 <= UIBoard.columns && row - 4 >= 0) {
            //up-right diagonal
            for index in 0...3 {
                if board[row - index][column + index].player == currentPlayer {
                    streak += 1
                    if streak == 4 { return true }
                }else{
                    streak = 0
                }
            }
        }else if(column - 4 >= 0 && row - 4 >= 0) {
            //up-left diagonal
            for index in 0...3 {
                if board[row - index][column - index].player == currentPlayer {
                    streak += 1
                    if streak == 4 { return true }
                }else{
                    streak = 0
                }
            }
        }else if(column + 4 <= UIBoard.columns && row + 4 <= UIBoard.rows){
            //down-right diagonal
            for index in 0...3 {
                if board[row + index][column + index].player == currentPlayer {
                    streak += 1
                    if streak == 4 { return true }
                }else{
                    streak = 0
                }
            }
        }else if(column - 4 >= 0 && row + 4 <= UIBoard.rows){
            //down-left diagonal
            for index in 0...3 {
                if board[row + index][column - index].player == currentPlayer {
                    streak += 1
                    if streak == 4 { return true }
                }else{
                    streak = 0
                }
            }
        }
        
        return false
    }
    
    private func getRowToUpdate(column: Int) -> Int? {
        for row in (0..<board.count).reversed() {
            guard let _ = board[row][column].player else {
                return row
            }
        }
        return nil
    }
    
    private func nextTurn(){
        if currentPlayer.color == .red {
            currentPlayer.color = .yellow
        }else {
            currentPlayer.color = .red
        }
    }
    
    private func checkBoardFull() -> Bool {
        return UIBoard.maxTiles == movements
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
