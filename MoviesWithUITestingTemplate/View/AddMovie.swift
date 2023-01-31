//
//  AddMovie.swift
//  MoviesWithUITestingTemplate
//
//  Created by Julie Collazos on 26/01/2023.
//

import SwiftUI

struct AddMovie: View {
    // var Environnement pour accéder aux fonctions existantes de l'écran modal
    @Environment(\.presentationMode) var presentationMode
    
    // variables d'état pour enregistrer en live ce que l'utilisateur tape dans chaque champ du formulaire
    @State var title: String = ""
    @State var director: String = ""
    @State var pitch: String = ""
    @State var year: String = ""
    // var d'état pour le picker avec un genre de film séléctionné par défaut
    @State var selectedGenre: Genre = .drama
    
    // var Binding pour pouvoir enregistrer le nouveau film dans la liste de l'écran parent (lié à une var State dans la vue Liste)
    @Binding var movies: [Movie]
    
    var body: some View {
        NavigationView {
            VStack {
                // formulaire
                Form {
                    // 1ere section du form
                    Section("Caractéristiques") {
                        TextField("Titre du film", text: $title, prompt: Text("Titre du film"))
                        TextField("Réalisateur", text: $director, prompt: Text("Réalisateur"))
                        TextField("Année de sortie", text: $year, prompt: Text("Année de sortie"))
                    }
                    // 2eme section du form
                    Section("Synospis") {
                        TextField("Pitch", text: $pitch, prompt: Text("Pitch"))
                            .frame(height: 100, alignment: .top)
                            .multilineTextAlignment(.leading)
                    }
                    // 3eme section du form avec le picker
                    Section("Genre") {
                        Picker("Genre", selection: $selectedGenre) {
                            Text("Drame").tag(Genre.drama)
                            Text("Action").tag(Genre.action)
                            Text("Romantique").tag(Genre.romantic)
                            Text("Thriller").tag(Genre.thriller)
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                    }
                }
            // Bouton sauvegarder le nouveau film dans la liste qui appel la fonction AddMovie() et appel la function dismiss() pour fermer l'écran modal une fois le film sauvegardé
                VStack(alignment: .center) {
                    Button(action: {
                        AddMovie()
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Sauvegarder")
                    })
                }
                Spacer()
                Spacer()
            }
           
        .navigationTitle("Ajouter un film")
        .navigationBarTitleDisplayMode(.inline)
        // Bouton pour fermer l'écran modal dans la navigation bar
        .navigationBarItems(
            trailing:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Fermer")
                }))
        }
       
    }
    // fonction pour enregistrer un nouveau film
    func AddMovie() {
        movies.append(Movie(title: title, director: director, image: "Infiltres", pitch: pitch, year: Int(year) ?? 0, genre: selectedGenre, isFavorite: false))
    }
}

struct AddMovie_Previews: PreviewProvider {
    static var previews: some View {
        AddMovie(movies: .constant(MoviesData().movies))
        }
}

