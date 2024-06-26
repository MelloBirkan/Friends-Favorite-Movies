//
//  SampleData.swift
//  FriendsFavoriteMovies
//
//  Created by Marcello Gonzatto Birkan on 14/04/24.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
  static let shared = SampleData() //singlethon
  
  let modelContainer: ModelContainer
  
  var context: ModelContext {
    modelContainer.mainContext
  }
  
  private init() {
    let schema = Schema([
        Movie.self,
    ])
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

    do {
        modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
      
      insertSampleData()
    } catch {
        fatalError("Could not create ModelContainer: \(error)")
    }
  }
  
  func insertSampleData() {
    for movie in Movie.sampleData {
      context.insert(movie)
    }
    do {
      try context.save()
    } catch {
      print("Sample data contect failed to save:\(error)")
    }
  }
  
  var movie: Movie {
    Movie.sampleData[0]
  }
}
