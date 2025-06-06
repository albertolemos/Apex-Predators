//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by Alberto Lemos on 06/06/25.
//

import SwiftUI

struct PredatorDetail: View {
  let predator: ApexPredator
  
    var body: some View {
      GeometryReader { geo in
        ScrollView {
          ZStack (alignment: .bottomTrailing) {
            // background image
            Image(predator.type.rawValue)
              .resizable()
              .scaledToFit()
            
            // dino image
            Image(predator.image)
              .resizable()
              .scaledToFit()
              .frame(width: geo.size.width/1.5, height: geo.size.height/3.7)
              .scaleEffect(x: -1)
              .shadow(color: .black, radius: 7)
              .offset(y: 20)
          }
          
          VStack(alignment: .leading) {
            // dino name
            Text(predator.name)
              .font(.largeTitle)
            
            // current location
            
            // appears in
            Text("Appears in:")
              .font(.title3)
            
            ForEach(predator.movies, id: \.self) { movie in
              Text("•" + movie)
                .font(.subheadline)
            }
            
            // movie moments
            Text("Movie moments:")
              .font(.title)
              .padding(.top, 15)
            
            ForEach(predator.movieScenes) { scene in
              Text(scene.movie)
                .font(.title2)
                .padding(.vertical, 1)
              
              Text(scene.sceneDescription)
                .font(.caption)
                .padding(.bottom, 15)
            }
            
            // link to webpage
            Text("Read more:")
              .font(.caption)
            
            Link(predator.link, destination: URL(string: predator.link)!)
              .font(.caption)
              .foregroundColor(.blue)
              .padding(.bottom, 10)
          }
          .padding()
          .frame(width: geo.size.width, alignment: .leading)
        }
      }
      .ignoresSafeArea()
    }
}

#Preview {
  PredatorDetail(predator: Predators().allApexPredators[2])
//    .preferredColorScheme(.dark)
}
