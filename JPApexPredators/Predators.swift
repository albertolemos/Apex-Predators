//
//  Predators.swift
//  JPApexPredators
//
//  Created by Alberto Lemos on 28/03/25.
//

import Foundation

class Predators {
  var apexPredators: [ApexPredator] = []
  
  init() {
    decodeApexPredatorData()
  }
  
  func decodeApexPredatorData() {
    if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
      do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        apexPredators = try decoder.decode([ApexPredator].self, from: data)
      } catch {
        print("Error decodind JSON data: \(error)")
      }
    }
  }
}
