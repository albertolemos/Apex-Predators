//
//  Predators.swift
//  JPApexPredators
//
//  Created by Alberto Lemos on 28/03/25.
//

import Foundation

class Predators {
  var apexPredators: [ApexPredator] = []
  var allApexPredators: [ApexPredator] = []
  
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
        allApexPredators = apexPredators
      } catch {
        print("Error decodind JSON data: \(error)")
      }
    }
  }
  
  func search(for searchTerm: String) -> [ApexPredator] {
    if searchTerm.isEmpty {
      return apexPredators
    } else {
      return apexPredators.filter { predator in
        predator.name.localizedCaseInsensitiveContains(searchTerm)
      }
    }
  }
  
  func sort(by alphabetical: Bool) {
    apexPredators.sort { (predator1, predator2) -> Bool in
      return alphabetical ? predator1.name < predator2.name : predator1.id < predator2.id
    }
  }
  
  func filter(by type: APType) {
    if type == .all {
      apexPredators = allApexPredators
    } else {
      apexPredators = allApexPredators.filter { predator in
        predator.type == type
      }
    }
  }
}
