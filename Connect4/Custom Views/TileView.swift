//
//  Tile.swift
//  Connect4
//
//  Created by Pau Ribot Pujolras on 26/10/22.
//

import SwiftUI

struct TileView: View {
    var tile : Tile
    let rect = CGRect(x: 0, y: 0, width: UI.screenWidth / 8, height: 50)
    
    var body: some View {
        getView()
    }
    
    private func HoleShapeMask(in rect: CGRect) -> Path {
        var shape = Rectangle().path(in: rect)
        shape.addPath(Circle().path(in: rect))
        return shape
    }
    
    @ViewBuilder func getView() -> some View {
        
        if let player = tile.player {
            if player.color == .red {
                Color(UIColor.systemBlue)
                    .frame(width: rect.width, height: rect.height)
                    .overlay {
                        Image("red_tile")
                            .resizable()
                    }
            }else{
                Color(UIColor.systemBlue)
                    .frame(width: rect.width, height: rect.height)
                    .overlay {
                        Image("yellow_tile")
                            .resizable()
                    }
            }
            
        }else{
            Rectangle()
                .fill(Color(UIColor.systemBlue))
                .frame(width: rect.width, height: rect.height)
                .mask(HoleShapeMask(in: rect).fill(style: FillStyle(eoFill: true)))
        }
    }
}



