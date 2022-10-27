//
//  ChipView.swift
//  Connect4
//
//  Created by Pau Ribot Pujolras on 26/10/22.
//

import SwiftUI

struct ChipView: View {
    
    var color : Color
    
    var body: some View {
        Image(color == Color.red ? "red_tile" : "yellow_tile")
            .resizable()
            .frame(width: UI.screenWidth / 8, height: 50)
    }
}

struct ChipView_Previews: PreviewProvider {
    static var previews: some View {
        ChipView(color: Color.pink)
    }
}
