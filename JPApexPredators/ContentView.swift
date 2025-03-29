//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Alberto Lemos on 28/03/25.
//

import SwiftUI

struct ContentView: View {
  let predators = Predators()
  
    var body: some View {
      List(predators.apexPredators) { predator in
        HStack {
          // dinousaur image
          Image(predator.image)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .shadow(color: .white, radius: 1)
          
          VStack(alignment: .leading) {
            // name
            Text(predator.name)
              .fontWeight(.bold)
            
            // type
            Text(predator.type.rawValue.capitalized)
              .font(.subheadline)
              .fontWeight(.semibold)
              .padding(.horizontal, 13)
              .padding(.vertical, 5)
              .background(predator.type.backgroundColor)
              .clipShape(.capsule)
          }
        }
      }
      .preferredColorScheme(.dark)
    }
    
}

#Preview {
    ContentView()
}
