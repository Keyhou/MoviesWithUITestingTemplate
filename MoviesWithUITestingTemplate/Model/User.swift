//
//  User.swift
//  MoviesWithUITestingTemplate
//
//  Created by Julie Collazos on 26/01/2023.
//

import Foundation

// Model du user
struct User: Identifiable {
    var id = UUID()
    var name: String
    var avatar: String
    var birthDate: String
    var description: String
    var preferedGenre: [Genre]
}

var user = User(name: "Hélène", avatar: "profil", birthDate: "22/02/1996", description: "Hello, I'm a movie fan and most of all I LOVE Leonardo DiCaprio ♥️", preferedGenre: [.drama, .thriller, .romantic])
