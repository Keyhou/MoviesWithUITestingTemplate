//
//  ContentView.swift
//  MoviesWithUITestingTemplate
//
//  Created by Julie Collazos on 26/01/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var moviesData: MoviesData
    var body: some View {
        TabView {
            ListView(searchMovies: moviesData.movies)
                .tabItem {
                    Image(systemName: "film.circle.fill")
                    Text("Films")
                }
            Profile(user: user)
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Profil")
                }
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MoviesData())
    }
}
