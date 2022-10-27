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
