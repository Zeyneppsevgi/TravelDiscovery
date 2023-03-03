//
//  TrendingCreatorsView.swift
//  TravelDiscoveryLBTA
//
//  Created by Zeynep Sevgi on 22.02.2023.
//

import SwiftUI

struct TrendingCreatorsView: View {
    
    let users: [User] = [
        .init(name: "Deniz Demir", imageName: "deniz"),
        .init(name: "Ali Can", imageName: "ali"),
        .init(name: "Fatma Kaya", imageName: "fatma"),
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Trending Creators")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            ScrollView(.horizontal) {
                HStack(alignment: .top,spacing: 12) {
                    ForEach(users,id:\.self) { user in
                        VStack {
                            Image(user.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60,height: 60)
                                .cornerRadius(60)
                            Text(user.name)
                                .font(.system(size: 10, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 60)
                            .shadow(color: .gray, radius: 4,x: 0.0,y: 2)
                            .padding(.bottom)
                            
                    }
                }.padding(.horizontal)
            }
        }
        
    }
}


struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsView()
    }
}
