//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Alberto Lemos on 28/03/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
  let predators = Predators()
  
  @State var searchText = ""
  @State var alphabetical = false
  @State var currentSelection = APType.all
  
  var filteredDinosaurs: [ApexPredator] {
    predators.filter(by: currentSelection)
    predators.sort(by: alphabetical)
    return predators.search(for: searchText)
  } 
  
  var body: some View {
    NavigationStack {
      List(filteredDinosaurs) { predator in
        NavigationLink {
          PredatorDetail(predator: predator, position: .camera(
            MapCamera(centerCoordinate: predator.location, distance: 30000)
          ))
        } label: {
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
      }
      .navigationTitle("Apex Predators")
      .searchable(text: $searchText)
      .autocorrectionDisabled()
      .animation(.default, value: searchText)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button {
            withAnimation() {
              alphabetical.toggle()
            }
          } label: {
            Image(systemName: alphabetical ? "film" : "textformat")
              .symbolEffect(.bounce, value: alphabetical)
          }
        }
        ToolbarItem(placement: .topBarTrailing) {
          Menu {
            Picker("Filter", selection: $currentSelection.animation()) {
              ForEach(APType.allCases) { type in
                Text("\(type.rawValue.capitalized)")
              }
            }
          } label: {
            Image(systemName: "slider.horizontal.3")
          }
        }
      }
    }
    .preferredColorScheme(.dark)
  }
}

#Preview {
  ContentView()
}
