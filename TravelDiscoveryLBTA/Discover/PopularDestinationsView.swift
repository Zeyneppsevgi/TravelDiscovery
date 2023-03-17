//
//  PopularDestinationsView.swift
//  TravelDiscoveryLBTA
//
//  Created by Zeynep Sevgi on 22.02.2023.
//

import SwiftUI
import MapKit

struct PopularDestinationsView: View {
    
    let destinations : [Destination] = [
        .init(name: "Paris", country: "France", imageName: "paris",latitude: 48.855014, longitude: 2.341231),
        .init(name: "Tokyo", country: "Japan", imageName: "tokyo",latitude: 35.67988, longitude: 139.7695),
        .init(name: "New York", country: "US", imageName: "newyork",latitude: 40.71592, longitude: -74.0055),
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular destinations")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            ScrollView(.horizontal) {
                HStack(spacing: 8.0) {
                    ForEach(destinations,id:\.self) { destination in
                        NavigationLink(destination: Text("Destination"),
                                       label: {
                            PopularDestinationTile(destination: destination)
                                
                                .padding(.bottom)
                        })
                       
                    }
                }.padding(.horizontal)
            }
        }
        
    }
}

struct PopularDestinationDetailsView: View {
    
    let destination: Destination
    
   // @State var region = MKCoordinateRegion(center: .init(latitude: 48.859565, longitude: 2.353235),span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1) )
    @State var region : MKCoordinateRegion
    @State var isShowingAttractions = false
    
    init(destination: Destination) {
        self.destination = destination
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude: destination.longitude),span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1) ))
      
    }
    
    
    var body: some View {
        
        
        ScrollView {
            
            DestinationHeaderContainer()
                .frame(width:  250)
            //Image(destination.imageName)
                //.resizable()
                //.scaledToFill()
         
                //.clipped()
            VStack (alignment: .leading){
                Text(destination.name)
                    .font(.system(size: 18,weight: .bold))
                Text(destination.country)
                
                HStack {
                    ForEach(0..<5, id:\.self) {num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }.padding(.top,2)
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                    .padding(.top,4)
                    .font(.system(size: 14))
                HStack{
                    Spacer()
                }
                
            }
            .padding(.horizontal)
            
            HStack {
                Text("Location")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
                
                Button(action: { isShowingAttractions.toggle() }, label: {
                    Text("\(isShowingAttractions ? "Hide" : "Show") Attractions")
                        .font(.system(size: 12, weight: .semibold))
                })
                
                // UIKit : UISwitch
                Toggle("", isOn: $isShowingAttractions)
                    .labelsHidden()
                
            }.padding(.horizontal)
            
          
            Map(coordinateRegion: $region, annotationItems: isShowingAttractions ? attractions : []) { attraction in
//                MapMarker(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude), tint: .blue)
                MapAnnotation(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude)) {
                    CustomMapAnnotation(attraction: attraction)
                }
            }
            .frame(height: 300)
            
        }.navigationBarTitle(destination.name, displayMode: .inline)
    }

    let attractions: [Attraction] = [
        .init(name: "Eiffel Tower",imageName: "paris",latitude: 48.858605, longitude: 2.2946),
        .init(name: "Champs-Elysees",imageName: "tokyo" ,latitude: 48.866867, longitude: 2.311780),
        .init(name: "Louvre Museum", imageName: "newyork",latitude: 48.860288, longitude: 2.337789)
    ]
   
}
struct CustomMapAnnotation: View {
    
    let attraction: Attraction
    
    var body: some View {
        VStack {
            Image(attraction.imageName)
                .resizable()
                .frame(width: 80, height: 60)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(.init(white: 0, alpha: 0.5)))
                )
            Text(attraction.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .background(LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                .foregroundColor(.white)
//                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(.init(white: 0, alpha: 0.5)))
                )
            
        }.shadow(radius: 5)
    }
}
struct Attraction: Identifiable {
    let id = UUID().uuidString
    
    let name, imageName: String
    let latitude, longitude: Double
}

struct PopularDestinationTile: View {
    
    let destination: Destination
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 125, height: 125)
                .cornerRadius(4)
                .padding(.horizontal, 6)
                .padding(.vertical, 6)
            
            Text(destination.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .foregroundColor(Color(.label))
            
            Text(destination.country)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
                .foregroundColor(.gray)
        }
        .asTile()
    }
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
       
        DiscoverView()
        PopularDestinationsView()
    }
}
