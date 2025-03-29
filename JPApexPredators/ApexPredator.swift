//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Alberto Lemos on 28/03/25.
//

import SwiftUI

struct ApexPredator: Decodable, Identifiable {
  let id: Int
  let name: String
  let type: APType
  let latitude: Double
  let longitude: Double
  let movies: [String]
  let movieScenes: [MovieScene]
  let link: String
  var image: String {
    name.lowercased().replacingOccurrences(of: " ", with: "")
  }
  
  struct MovieScene: Decodable {
    let id: Int
    let movie: String
    let sceneDescription: String
  }
  
  enum APType: String, Decodable {
    case land
    case air
    case sea
    
    var backgroundColor: Color {
      switch self {
      case .land:
        .brown
      case .air:
        .teal
      case .sea:
        .blue
      }
    }
  }
}
