//
//  PredatorMap.swift
//  JPApexPredators
//
//  Created by KurianThomas on 24/07/26.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    @State var position:MapCameraPosition
    @State var satellite = false
    let predators = Predators()
    
    var body: some View {
        
        Map(position: $position){
            
    ForEach(predators.apexPredators){ predator in
                
        Annotation(predator.name, coordinate: predator.location) {
            Image(predator.image)
                .resizable()
                .scaledToFit()
                .frame(height: 110)
                .scaleEffect(x:-1)
                .shadow(color:.white ,radius: 3)
        }
                
            }
        }
        .mapStyle(satellite ?.imagery(elevation: .realistic) : .standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing){
            Button{
               satellite.toggle()
            }label: {
        Image(systemName: satellite ? "globe.americas.fill" : "globe.americas")
                
                .font(.largeTitle)
                .padding(4)
                .imageScale(.large)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 7))
                .shadow(radius: 7)
                .padding()
                
            }
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    PredatorMap(position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[2].location,
  distance: 1250,
 heading: 250,
 pitch: 80)))
    .preferredColorScheme(.dark)
}
