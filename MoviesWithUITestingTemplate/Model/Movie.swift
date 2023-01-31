//
//  Movie.swift
//  MoviesWithUITestingTemplate
//
//  Created by Julie Collazos on 26/01/2023.
//

import Foundation

// Enum pour limiter le genre de film possible qu'on lie au model Movie et au model User
enum Genre: String {
    case thriller = "Thriller"
    case romantic = "Romantique"
    case action = "Action"
    case drama = "Drame"
    case horror = "Horreur"
}

// Model des films
struct Movie: Identifiable {
    var id = UUID()
    var title: String
    var director: String
    var image: String
    var pitch: String
    var year: Int
    var genre: Genre
    var isFavorite: Bool
}
