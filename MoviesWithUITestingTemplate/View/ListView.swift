//
//  ListView.swift
//  MoviesWithUITestingTemplate
//
//  Created by Julie Collazos on 26/01/2023.
//

import SwiftUI

struct ListView: View {
    // var d'état pour afficher la modale (bool)
    @State private var isAddMoviePresented = false
    // var d'état pour écouter ce que l'utilisateur tape dans la barre de recherche
    @State private var searchText = ""
    
    // var d'état pour afficher les résultats de la recherche en live
    @State var searchMovies: [Movie]
    
    // var d'environnement de ma class observable MoviesData
    @EnvironmentObject var moviesData: MoviesData
    
    
    var body: some View {
//        var searchMovies = moviesData.movies
        NavigationView {
            // liste des films
            List {
                ForEach(searchMovies) { movie in
                    NavigationLink(destination: {
                        DetailView(movie: movie)
                    }, label: {
                        HStack {
                            Image(systemName: "film")
                                .foregroundColor(.accentColor)
                            Text(movie.title)
                                .padding(.vertical)
                                .padding(.leading)
                            Text(String("(\(movie.year))"))
                                .font(.caption)
                        }
                        
                    })
                }
            }
            .accessibilityIdentifier("movieList")
    //             barre de recherche
                .searchable(text: $searchText, placement:  .navigationBarDrawer(displayMode: .always),
                    prompt: "Titre de film")
                .onChange(of: searchText.lowercased()) { movie in
                    if !movie.isEmpty {
                        searchMovies = moviesData.movies.filter { $0.title.lowercased().contains(movie) }
                    } else {
                        searchMovies = moviesData.movies
                    }
                }
                // titre de l'écran
                .navigationTitle("Movies")
                .navigationBarTitleDisplayMode(.inline)
                // bouton dans la barre de navigation pour afficher la modale
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            isAddMoviePresented.toggle()
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                        })
                    // appel de la modale avec la var d'état de type bool
                        .sheet(isPresented: $isAddMoviePresented, content: {
                            AddMovie(movies: $searchMovies)
                        })
            )
          
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(searchMovies: MoviesData().movies)
            .environmentObject(MoviesData())
    }
}
