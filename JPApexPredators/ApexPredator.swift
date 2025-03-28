//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Alberto Lemos on 28/03/25.
//

struct ApexPredator: Decodable {
  let id: Int
  let name: String
  let type: String
  let latitude: Double
  let longitude: Double
  let movies: [String]
  let movieScenes: [MovieScene]
  let link: String
  
  struct MovieScene: Decodable {
    let id: Int
    let movie: String
    let sceneDescription: String
  }
}
