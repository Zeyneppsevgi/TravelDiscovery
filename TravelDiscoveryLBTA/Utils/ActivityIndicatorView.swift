//
//  ActivityIndicatorView.swift
//  TravelDiscoveryLBTA
//
//  Created by Zeynep Sevgi on 28.02.2023.
//

import SwiftUI

struct ActivityIndicatorView : UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    typealias UIViewType = UIActivityIndicatorView
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    
    }
}
struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView()
    }
}
