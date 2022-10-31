//
//  Player.swift
//  Connect4
//
//  Created by Pau Ribot Pujolras on 26/10/22.
//

import Foundation

struct Player : Equatable {
    var color : PlayerColor
    var wins = 0
}

enum PlayerColor {
    case yellow
    case red
}

struct Players {
    var redPlayer = Player(color: .red)
    var yellowPlayer = Player(color: .yellow)
    var current = Player(color: .red)
    
    mutating func addWin(to player: PlayerColor) {
        switch player {
        case .yellow:
            yellowPlayer.wins += 1
        case .red:
            redPlayer.wins += 1
        }
    }
    
    func totalWins() -> Int {
        return redPlayer.wins + yellowPlayer.wins
    }
    
    mutating func resetScore() {
        redPlayer.wins = 0
        yellowPlayer.wins = 0
    }
    
    mutating func toggle(){
        if current.color == .red {
            current.color = .yellow
        }else {
            current.color = .red
        }
    }
}
