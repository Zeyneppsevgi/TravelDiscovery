//
//  TileModifier.swift
//  TravelDiscoveryLBTA
//
//  Created by Zeynep Sevgi on 22.02.2023.
//

import SwiftUI

extension View {
    
    func asTile() -> some View {
        modifier(TileModifer())
    }
}

struct TileModifer : ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: .init(.sRGB,white: 0.5,opacity: 1), radius: 4,x: 0.0,y: 2)
        
    }
}
